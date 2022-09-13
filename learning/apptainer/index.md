---
layout: note
category: cs
title: Apptainer/Singularity
subtitle: Application container on HPC clusters
---

## Create a container

```sh
# create a sandbox folder to build the container
# it is OK to do it as a normal user without 'sudo'
sudo apptainer build -s sandbox/ docker://ubuntu
# get into the container with 'write' privilege
apptainer shell --writable sandbox/
# make changes in the sandbox
apt-get update
apt-get install my_app
exit
# package and copy to a remote server as a normal user
tar czfv ubuntu.tar.gz sandbox/
scp ubuntu.tar.gz user@remote.hpc.server:
# or package it as an administrator
sudo apptainer build ubuntu.sif sandbox/
scp ubundu.sif user@remote.hpc.server:
```

Once you figure out the right way to create a container in a sandbox, you can document it in a text file ended with `.def`, for example, `ubuntu.def`:

```sh
BootStrap: docker
From: ubuntu

%post
apt-get install -y my_app
```

and then run

```sh
sudo apptainer build ubuntu.sif ubuntu.def
```

to create the image.

## Remote build

Another way to build an image without the administrator privilege is to create an account on <https://cloud.sylabs.io/>, create an access token there, copy it and run

```sh
apptainer remote login
Access Token: <paste your token here>
INFO: Access Token Verified!
INFO: Token stored in /home/user/.apptainer/remote.yaml
```

Now, you can run

```sh
apptainer build -r ubuntu.sif ubuntu.def
```

to build the image on <https://cloud.sylabs.io/>.

## Remote image

Container images can be fetched/saved from/in remote servers, such as <https://cloud.sylabs.io/>:

```sh
# upload local image to remote server
apptainer push ubuntu.sif library://my_sylabs_username/my_proj/my_app:latest
# download image on remote server to local disk
apptainer pull library://my_sylabs_username/my_proj/my_app:latest ubuntu.sif
```

It is a good practice to sign/verify an image before you push it to the remote server/after you pull it from the remote server. To do that, you need to have a pair of PGP keys:

```sh
# create a new pair of keys
apptainer key newpair
# push the public key to the remote server
apptainer push
# sign the image before pushing it to the server
apptainer sign ubuntu.sif
```

You can also copy the created private key to another computer:

```sh
# export the private key to a file
apptainer key export --secrete private.asc
# copy it to another computer
scp private.asc user@another.computer:
ssh user@another.computer
apptainer key import private.asc
apptainer key list
```
