---
tags: [Linux, VNC, SSH]
---

![Linux Cluster Structure](https://www.hpc.iastate.edu/sites/default/files/uploads/HPCHowTo/HPCCluster.JPG)


### Linux cluster

A [Linux cluster](https://www.tecmint.com/what-is-clustering-and-advantages-disadvantages-of-clustering-in-linux/) is a group of Linux machines working as a whole. Each machine is called a node. They share the same home directory. There is normally a login node, which you can `ssh` into. While you cannot log into other nodes directly, you can submit jobs (programs) from the login node to other nodes through a program called job scheduler.

#### Job scheduler

[Slurm][] is a popular [job scheduler](https://en.wikipedia.org/wiki/Job_scheduler) that helps to distribute jobs to less busy nodes in a Linux cluster. A quick guide can be found [here](https://usdrcg.gitbook.io/docs/lawrence-hpc/submitting-jobs).

### VNC on login node

The easiest way to run an VNC server in a Linux cluster is to run it at the login node. The method is describe [here]({% post_url learning/2020-01-22-SSH %}).

### VNC on non-login node

The job of the login node is not to `run jobs`, including running VNC servers, but to distribute jobs to other nodes. The correct way to run a VNC server in a Linux cluster is to run it in a non-login node. You cannot log into a non-login node directly, your VNC viewer faces the same problem, it cannot get connect to the VNC server running at a non-login node. The connection has to be established through the login node using [SSH port forwarding]({% post_url learning/2020-01-22-SSH %}).

#### SSH local port forwarding

One can connect a local port, say, 53925, to a VNC port, say, 5908, at a non-login node through the login node. The method is describe well [here](https://docs.ycrc.yale.edu/clusters-at-yale/access/vnc/) and [here](https://info.nrao.edu/computing/guide/cluster-processing/appendix/accessing-the-cvpost-cluster-with-vnc).

#### Both local and remote port forwarding

The disadvantage of the previous method is that you have to change your ssh config based on the non-login node number and the VNC port that are assigned randomly each time you run an VNC server in a non-login node. To avoid this, you can forward the random VNC port number to a fixed port number chosen by you at the login node, and forward the latter to a fixed port number, say, 53925, in your local machine. You can then use a VNC viewer to connect to `127.0.0.1:53925`, which will be forwarded to the `node32.remote.cluster:5908`. There is no need to change your local VNC viewer settings and your local ssh config this way. Here are the steps to achieve this.

First of all, add the following lines to your `~/.ssh/config`:

```sh
Host l
HostName login.remote.cluster
User User.Name
LocalForward 53925 127.0.0.1:57848
```

Now run

```sh
$ ssh l # ssh into the login node
```

This not only logs you into the login node, but also forward any connection to your local port 53925 to port 57848 at the login node. At the login node, run

```
login $ srun --pty bash
node32 $
```

to switch from the login node to a non-login node (for example, node32) using [Slurm][]. You may need to change this command to something else based on your [job scheduler](https://en.wikipedia.org/wiki/Job_scheduler). Now that you are at node32, you can start the VNC server:

```sh
$ vncserver
$ vncserver -list

TigerVNC server sessions:

X DISPLAY #     PROCESS ID
:8              10949
```

Your VNC server is running at port 5900 + the X DISPLAY number, which is 5908 in this example. Since this port cannot be accessed directly from outside, you need to forward it to port 57848 at the login node using

```
node32 $ ssh -R 57848:127.0.0.1:5908 login.remote.cluster
login $
```

This also takes you back to the login node. Note that you should `ssh` back instead of logging out from node32 back to the login node. Logging out or closing the terminal will terminate the VNC server without removing `~/.vnc/node32.cluster:8.pid`. You think your VNC server is still running because the `pid` file is still there, but in reality it is gone already. (Please refer to the [Trouble shooting](#trouble-shooting) section for details.

Now you have successfully connected your local PC's port 53925 to port 5908 at node32 through port 57848 at the login node. It's time for you to point your local VNC viewer to `127.0.0.1:53925`, which, in reality, is connected to `node32:5908`. The connection routes are shown in the figure below:

![ssh tunnel map]({{site.ina}}/ssh-tunnels.png)

To turn off the VNC server, you need to at first quit from the login node back to node32, and run `vncserver -kill :8`:

```sh
login $ exit
node32 $ vncserver -kill :8
```

and then quit from node32 back to the login node, then quite from the login node back to your own machine.

#### Automation

If you have no problem to follow the above steps manually. You can try to automate the process. Starting from `srun --pty bash`, all the steps afterward can be saved in a shell script, say, `vnc.sh`. You can then submit it to your job scheduler, say, [Slurm][], using the following command:

```sh
login $ sbatch vnc.sh
login $ squeue -u Your.Username # confirm that your VNC server is running in a node
```

The contents of `vnc.sh` looks like

```sh
#!/bin/bash
# Modified VNC job script, based on:
# https://portal.tacc.utexas.edu/user-guides/stampede2#remote-desktop-access

#SBATCH -J vncserver  # Job name
#SBATCH -p nodes      # Queue name
#SBATCH -o %j.out     # Output File Name
#SBATCH -N 1          # Total number of nodes requested (20 cores/node)

echo job $JOB_ID execution at: `date`

NODE_HOSTNAME=`hostname -s`
echo "running on node $NODE_HOSTNAME"

VNCSERVER_BIN=`which vncserver`
echo "using default VNC server $VNCSERVER_BIN"

# Check whether a vncpasswd file exists.  If not, complain and exit.
if [ \! -e $HOME/.vnc/passwd ] ; then
  echo
  echo "=================================================================="
  echo "   You must run 'vncpasswd' once before launching a vnc session"
  echo "=================================================================="
  echo
  exit 1
fi

# launch VNC session
VNC_DISPLAY=`$VNCSERVER_BIN $@ -bs 2>&1 | grep desktop | awk -F: '{print $3}'`
echo "got VNC display :$VNC_DISPLAY"

# make sure this is a valid display
if [ x$VNC_DISPLAY == "x" ]; then
  echo
  echo "===================================================="
  echo "   ERROR: No vnc display found"
  echo "   Error launching vncserver: $VNCSERVER"
  echo "===================================================="
  echo
  exit 1
fi

LOCAL_VNC_PORT=`expr 5900 + $VNC_DISPLAY`
echo "local (compute node) VNC port is $LOCAL_VNC_PORT"

# create reverse tunnel port to login node.
ssh -vfgN -i ~/.ssh/id_rsa -R 57848$NODE_HOSTNAME:$LOCAL_VNC_PORT login
echo ssh -vfgN -i ~/.ssh/id_rsa -R 57848$NODE_HOSTNAME:$LOCAL_VNC_PORT login

# set display for X applications
export DISPLAY=":$VNC_DISPLAY"

# run window manager; execution will hold here
fluxbox
#gnome-shell -d :$VNC_DISPLAY

# job is done!
echo "Stopping VNC server"
vncserver -kill $DISPLAY

# wait a brief moment so vncserver can clean up after itself
sleep 1

echo job $SLURM_JOB_ID execution finished at: `date`

rm ~/.vnc/*.cluster:*.log
mv *.out  ~/.vnc/
```

### Trouble shooting

#### **Q:** What shall I do if I forget my VNC password?

The VNC password is saved in the file `~/.vnc/passwd`. You can delete it and run

```sh
$ vncpasswd
```

to regenerate this file and save your new password in it. You don't have to restart your running VNC server. This change takes effect on the fly.

#### **Q:** I forgot to kill my old VNC server before starting a new one. Would that harm the cluster?

If you run many VNC servers at the login node. The login node may become slow for all the cluster users. You'd better kill them immediately:

```sh
login $ vncserver -list # list all running VNC servers

TigerVNC server sessions:

X DISPLAY #     PROCESS ID
:1                 12394
:2                 25823
:3                 43984

login $ vncserver -kill :1
login $ vncserver -kill :2
login $ vncserver -kill :3
```

#### **Q:** I cannot remember where I started a VNC server. How can I find it out?

If you run a few VNC servers in a few different nodes, while you are now at the login node, `vncserver -list` cannot help you, because it only lists running VNC servers in your current node. You should check what's in your `~/.vnc` directory:

```sh
login $ cd .vnc
login $ ls
config  node32.cluster:1.log  node32.cluster:1.pid  passwd  xstartup
```

A running VNC server is associated with a file that end with `.pid`. From this file, you know that you are running a VNC server at `node32` and DISPLAY `:1`. When the VNC server stops, the associated `.pid` file is gone together. So it is a good indicator for running VNC servers. Don't use the `.log` file as an indicator since it will not be deleted when the VNC server stops. You can delete the old log files by yourself safely.


#### **Q:** I launched a VNC server in a non-login node and then logged out or closed that terminal. How can I stop the server now?

If you quit from a non-login node back to your login node, your VNC server should be killed by the cluster automatically. You can also run

```sh
$ squeue -u your.username # list your submitted jobs
JOBID  PARTITION     NAME      USER ST  TIME  NODES NODELIST(REASON)
737341 preemptib     bash user.name CG  5:18      1 node32
$ scancel 737341 # kill job 737341
```

To find out the job id of your VNC server and kill it using `scancel`.

However, all the above have some side effect. They will leave behind a few files that should have been deleted:

```sh
~/.vnc/node32.cluster:1.log
~/.vnc/node32.cluster:1.pid
/tmp/.X1-lock
/tmp/.X11-unix/X1=
```

You can delete the first two files manually if you cannot find the corresponding jobs in the output of `squeue -u your.username`. It is not easy to delete the two in `/tmp` directory because the `/tmp` directory is not shared among all nodes, each node has its own `/tmp` directory. You need to log back into that node to delete them, which can be achieved using

```sh
login $ srun -w node32 --pty bash
```

However, you may need to wait for a long time to log back to node32 if it is busy running other jobs. The good news is that files in `/tmp` will be deleted eventually by the machine automatically at some point.

#### **Q:** I saw the following warning message, shall I worry about it?

```sh
node32 $ vncserver

Warning: node32.cluster:1 is taken because of /tmp/.X1-lock
Remove this file if there is no X server node32.cluster:1

Warning: node32.cluster:2 is taken because of /tmp/.X2-lock
Remove this file if there is no X server node32.cluster:2

New 'node32.cluster:3 (your.username)' desktop is node32.cluster:3

Starting applications specified in /home/your.usrname/.vnc/xstartup
Log file is /home/your.usrname/.vnc/node32.cluster:3.log

```

No, your VNC server still managed to run at DISPLAY number `:3` eventually. The warning is issued because your VNC server detected the existence of `/tmp/.X1-lock` but cannot find a really running X-window at DISPLAY number `:1`. That file is a left over by another VNC server that was not stopped cleanly. Run

```sh
node32 $ ls -l /tmp/.X*
```

to find out if you own one of those files. If yes, please delete them to release those locked DISPLAY numbers. If no, you can inform their owners so that they can delete them using the way described in the previous question.

[Slurm]: https://slurm.schedmd.com/

