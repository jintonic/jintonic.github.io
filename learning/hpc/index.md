---
layout: note
title: HPC
subtitle: Hight Performance Computing
tags: [Linux, HPC]
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

>Grid computing is the collection of computer resources from multiple 
>locations to reach a common goal. The grid can be thought of as a distributed 
>system with non-interactive workloads that involve a large number of files. 
>Grid computing is distinguished from conventional high performance computing 
>systems such as cluster computing in that grid computers have each node set 
>to perform a different task/application.

## Job scheduler
According to Wikipedia:
>A job scheduler is a computer application for controlling unattended 
>background program execution of jobs. This is commonly called batch 
>scheduling, as execution of non-interactive jobs is often called batch 
>processing, .... Other synonyms include batch system, distributed resource 
>management system (DRMS), distributed resource manager (DRM), and, commonly 
>today, workload automation.

[SLURM][] (Simple Linux Utility for Resource Management) is replacing [SGE][] (Sun Grid Engine) in many Linux clusters as the latter is not actively maintained anymore.  [Condor][] was designed back in the day for farming out jobs between diverse resources (e.g., workstations after hours) and would have a lot of overhead for working within a homogeneous cluster.  It may be used to schedule jobs between clusters. The installation is not easy. [SGE][], [OGE][], [Torque][]/[PBS][], [openlava][], [LSF][] have very similar user command list.

[SLURM]: https://www.schedmd.com
[SGE]: https://en.wikipedia.org/wiki/Oracle_Grid_Engine
[Condor]: https://en.wikipedia.org/wiki/HTCondor
[OGE]: http://gridscheduler.sourceforge.net
[Torque]: https://en.wikipedia.org/wiki/TORQUE
[PBS]: https://en.wikipedia.org/wiki/Portable_Batch_System
[openlava]: https://en.wikipedia.org/wiki/OpenLava
[LSF]: https://en.wikipedia.org/wiki/IBM_Spectrum_LSF

## SLURM

- `-w node0xx` or `--nodelist=node0xx`: specify a node when submitting a job

### salloc

`salloc` is intended to work with subsequent `srun` commands. `salloc` allocates resources and then creates an interactive shell in the login node, where the user can run a command through `srun`. The newly created shell has all the information about the allocated resources, there is hence no need to pass options to the subsequent `srun`. This command is created to solve the problem that one cannot run `srun` inside an `srun`.

### Switching from PBS to SLURM

| command | set job name | set output file | set error file | inherit enviroment variables |
|---|---|---|---|---|
| qsub | -N | -o | -e | -V |
| sbatch | -J | -o | -e | no need |

## Common commands in an SGE type scheduler

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
# -N: give the job a specific name
# -cwd: start from current working directory (not available in PBS)
# -e direct stderr to a file, -o direct stdout to a file
# -b y: is a binary file, -b n: is a script (PBS can only handle script)
# -S specify shell
qsub -V -cwd -e run.err -o run.log -b n -S /bin/sh example.sh
qstat # show job status of current user
qstat -u \* # show job status of all users
qdel <job id> # delete a job
qdel -u <user> # delete jobs from user
qsub --version # get to know how old your scheduler is
# https://stackoverflow.com/a/18408251
qsub -l nodes=<node_name> # submit to specific node
~~~

