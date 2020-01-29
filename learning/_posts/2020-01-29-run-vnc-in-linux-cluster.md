---
tags: [Linux, VNC, SSH]
---

### Linux cluster

A [Linux cluster](https://www.tecmint.com/what-is-clustering-and-advantages-disadvantages-of-clustering-in-linux/) is a group of Linux machines working as a whole. Each machine is called a node. There is normally a login node, which you can `ssh` into. While you cannot log into other nodes directly, you can submit jobs (programs) from the login node to other nodes through a program called job scheduler.

#### Job scheduler

[Slurm](https://slurm.schedmd.com/) is a popular [job scheduler](https://en.wikipedia.org/wiki/Job_scheduler) that helps to distribute jobs to less busy nodes in a Linux cluster. A quick guide can be found [here](https://usdrcg.gitbook.io/docs/lawrence-hpc/submitting-jobs).

### VNC on login node

The easiest way to run an VNC server in a Linux cluster is to run it at the login node. The method is describe [here]({% post_url learning/2020-01-22-SSH %}).

### VNC on non-login node

The job of the login node is not to `run jobs`, including running VNC servers, but to distribute jobs to other nodes. The correct way to run a VNC server in a Linux cluster is to run it in a non-login node. You cannot log into a non-login node directly, your VNC viewer faces the same problem, it cannot get connect to the VNC server running at a non-login node. The connection has to be established through the login node using [SSH port forwarding]({% post_url learning/2020-01-22-SSH %}).

#### SSH local port forwarding

One can connect a local port, say, 59382, to a VNC port, say, 5901, at a non-login node through the login node. The method is describe well [here](https://docs.ycrc.yale.edu/clusters-at-yale/access/vnc/) and [here](https://info.nrao.edu/computing/guide/cluster-processing/appendix/accessing-the-cvpost-cluster-with-vnc).

#### SSH local and remote port forwarding

The disadvantage of the previous method is that you have to change your ssh config based on the non-login node number and the VNC port that are assigned randomly each time you run an VNC server in a non-login node. To avoid this, you can forward the random VNC port number to a fixed port number chosen by you at the login node, and forward the latter to a fixed port number, say, 59832, in your local machine. You can then use a VNC viewer to connect to `127.0.0.1:59832`, which will be forwarded to the `non.login.node:590x`. There is no need to change your loca VNC viewer settings and your local ssh config this way.
