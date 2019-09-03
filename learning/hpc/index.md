---
layout: note
title: HPC
subtitle: Hight Performance Computing
---

According to Wikipedia:
>A computer cluster consists of a set of loosely or tightly connected 
>computers that work together so that, in many respects, they can be viewed as 
>a single system. Unlike grid computers, computer clusters have each node set 
>to perform the same task, controlled and scheduled by software.
>
>The components of a cluster are usually connected to each other through fast 
>local area networks ("LAN"), with each node (computer used as a server) 
>running its own instance of an operating system. In most circumstances, all 
>of the nodes use the same hardware and the same operating system, although 
>in some setups (i.e. using Open Source Cluster Application Resources 
>(OSCAR)), different operating systems can be used on each computer, and/or 
>different hardware.

## Job scheduler
According to Wikipedia:
>A job scheduler is a computer application for controlling unattended 
>background program execution of jobs. This is commonly called batch 
>scheduling, as execution of non-interactive jobs is often called batch 
>processing, .... Other synonyms include batch system, distributed resource 
>management system (DRMS), distributed resource manager (DRM), and, commonly 
>today, workload automation.

According to https://www.biostars.org/p/54154/, SGE is very stable, it comes together with Rocks Cluster Distribution, and XSEDE provides a lot of training material for it. Condor was designed back in the day for farming out jobs between diverse resources (e.g., workstations after hours) and would have a lot of overhead for working within a homogeneous cluster.  It may be used to schedule jobs between clusters. The installation is not easy. SGE, Torque/PBS, openlava, LSF, SLURM have very similar user command list.

## Commonly used commands in SGE type scheduler

~~~sh
qhost # list loads of all nodes
qconf -sql # show queue list
qconf -sconf # show global configuration
~~~

Pay attention to the following two settings: `shell_start_mode` and 
`login_shells`. The first setting has two interesting options: 
`posix_compliant` and `unix_behavior`. If the first one is 
chosen, the first line of a shell script, for example, `bin/sh`, 
will be ignored. One has to use the `S` option to specify the shell 
to use. If the second one is chosen, the first line will take effect. The 
second setting lists all shells that can be used. Ask your administrator to add 
your favorite shell in the list if it is not there.

~~~sh
# -V: inherit all environment variables
# -cwd: start from current working directory
# -e direct stderr to a file, -o direct stdout to a file
# -b y: is a binary file, -b n: is a script
# -S specify shell
qsub -V -cwd -e run.err -o run.log -b n -S /bin/sh example.sh
qstat # show job status of current user
qstat -u \* # show job status of all users
qdel <job id> # delete a job
qdel -u <user> # delete jobs from user
~~~
