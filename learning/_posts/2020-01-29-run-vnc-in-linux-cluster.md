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

One can connect a local port, say, 43582, to a VNC port, say, 5901, at a non-login node through the login node. The method is describe well [here](https://docs.ycrc.yale.edu/clusters-at-yale/access/vnc/) and [here](https://info.nrao.edu/computing/guide/cluster-processing/appendix/accessing-the-cvpost-cluster-with-vnc).

#### Both local and remote port forwarding

The disadvantage of the previous method is that you have to change your ssh config based on the non-login node number and the VNC port that are assigned randomly each time you run an VNC server in a non-login node. To avoid this, you can forward the random VNC port number to a fixed port number chosen by you at the login node, and forward the latter to a fixed port number, say, 59832, in your local machine. You can then use a VNC viewer to connect to `127.0.0.1:43852`, which will be forwarded to the `non.login.node:590x`. There is no need to change your loca VNC viewer settings and your local ssh config this way. Here are the steps to achieve this.

First of all, add the following lines to your `~/.ssh/config`:

```sh
Host l
HostName linux.cluster.login.node
User User.Name
LocalForward 43852 127.0.0.1:59832
```

Now run

```sh
$ ssh l # ssh into the login node
```

This not only logs you into the login node, but also forward any connection to your local port 43852 to port 59832 at the login node. At the login node, run

```
login $ srun --pty bash
node26 $
```

to switch from the login node to a non-login node (for example, node26) using [Slurm][]. You may need to change this command to something else based on your [job scheduler](https://en.wikipedia.org/wiki/Job_scheduler). Now that you are at node26, you can start the VNC server:

```sh
$ vncserver
$ vncserver -list

TigerVNC server sessions:

X DISPLAY #     PROCESS ID
:1              10949
```

Your VNC server is running at port 5900 + the X DISPLAY number, which is 5901 in this example. Since this port cannot be accessed directly from outside, you need to forward it to port 59832 at the login node using

```
node26 $ ssh -R 59832:127.0.0.1:5901 linux.cluster.login.node
login $
```

This also takes you back to the login node. Note that you should `ssh` back instead of logging out from node26 back to the login node. This action will terminate the VNC server without removing `~/.vnc/node26.cluster:1.pid`. You think your VNC server is still running because the `pid` file is still there, but in reality it is gone already.

Now you have successfully connected your local PC's port 43852 to port 5901 at node26 through port 59832 at the login node. It's time for you to point your local VNC viewer to `127.0.0.1:43852`, which, in reality, is connected to `node26:5901`.

The remote port forwarding command line option `-R 59832:127.0.0.1:5901` can be saved in your `~/.ssh/config` at the Linux cluster:

```
Host l
HostName linux.cluster.login.node
RemoteForward 59832 127.0.0.1:5901
```

This way, the last command can be simplified to

```
node26 $ ssh l
login $
```

To turn off the VNC server, you need to at first quit from the login node back to node26, and run

```sh
$ vncserver -kill :1
```

and then quit from node26 back to the login node, then quite from the login node back to your own machine.

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
config  node20.cluster:1.log  node20.cluster:1.pid  passwd  xstartup
```

A running VNC server is associated with a file that end with `.pid`. From this file, you know that you are running a VNC server at `node20` and DISPLAY `:1`. When the VNC server stops, the associated `.pid` file is gone together. So it is a good indicator for running VNC servers. Don't use the `.log` file as an indicator since it will not be deleted when the VNC server stops. You can delete the old log files by yourself safely.


#### **Q:** I launched a VNC server in a non-login node and then logged out or closed that terminal. How can I stop the server now?

If you quit from a non-login node back to your login node, your VNC server should be killed by the cluster automatically. You can also run

```sh
$ squeue -u your.username # list your submitted jobs
JOBID  PARTITION     NAME      USER ST  TIME  NODES NODELIST(REASON)
737341 preemptib     bash user.name CG  5:18      1 node20
$ scancel 737341 # kill job 737341
```

To find out the job id of your VNC server and kill it using `scancel`.

However, all the above have some side effect. They will leave behind a few files that should have been deleted:

```sh
~/.vnc/node20.cluster:1.log
~/.vnc/node20.cluster:1.pid
/tmp/.X1-lock
/tmp/.X11-unix/X1=
```

You can delete the first two files manually if you cannot find the corresponding jobs in the output of `squeue -u your.username`. It is not easy to delete the two in `/tmp` directory because the `/tmp` directory is not shared among all nodes, each node has its own `/tmp` directory. You need to log back into that node to delete them, which can be achieved using

```sh
login $ srun -w node20 --pty bash
```

However, you may need to wait for a long time to log back to node20 if it is busy running other jobs. The good news is that files in `/tmp` will be deleted eventually by the machine automatically at some point.

#### **Q:** I saw the following warning message, shall I worry about it?

```sh
node19 $ vncserver

Warning: node19.cluster:1 is taken because of /tmp/.X1-lock
Remove this file if there is no X server node19.cluster:1

Warning: node19.cluster:2 is taken because of /tmp/.X2-lock
Remove this file if there is no X server node19.cluster:2

New 'node19.cluster:3 (your.username)' desktop is node19.cluster:3

Starting applications specified in /home/your.usrname/.vnc/xstartup
Log file is /home/your.usrname/.vnc/node19.cluster:3.log

```

No, your VNC server still managed to run at DISPLAY number `:3` eventually. The warning is issued because your VNC server detected the existence of `/tmp/.X1-lock` but cannot find a really running X-window at DISPLAY number `:1`. That file is a left over by another VNC server that was not stopped cleanly. Run

```sh
node19 $ ls -l /tmp/.X*
```

to find out if you own one of those files. If yes, please delete them to release those locked DISPLAY numbers. If no, you can inform their owners so that they can delete them using the way described in the previous question.

[Slurm]: https://slurm.schedmd.com/

