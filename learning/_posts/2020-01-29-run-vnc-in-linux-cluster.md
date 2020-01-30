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

This also takes you back to the login node. Now you have successfully connected your local PC's port 43852 to port 5901 at node26 through port 59832 at the login node. It's time for you to point your local VNC viewer to `127.0.0.1:43852`, which, in reality, is connected to `node26:5901`.

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


[slurm]: https://slurm.schedmd.com/
