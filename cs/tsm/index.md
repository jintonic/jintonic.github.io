---
layout: page
category: cs
title: TSM - Tivoli Storage Manager
---
[Manual](http://accc.uic.edu/service/backups/manuals)

Basic concepts
==============
- *server* There is a server taking care of the backup media
- *client* backup commands are run in clients, which will send data to the
  server and the later will save it to the backup media 
- *archive* To archive a file is to copy it to the storage, where the
  previously copied file, if exists, is overwritten
- *backup* To backup a file is to copy it to the storage, where the previously
  copied file, if exists, becomes an inactive version. The current copied one
  becomes the active version in the backup media. The number of inactive
  versions is controlled by the server

Basic usage
===========

There is a GUI based on java, _dsmj_, a web based UI, http://localhost:1581 and
a command line UI _dsmc_, which can be used interactively:

    $ dsmc
    tsm> help
    tsm> quit
    tsm> q b /path/to/ # querry backups in /path/to/ directory
    tsm> i /path/to/file # backup /path/to/file
    tsm> i /path/to/file # back it up again, an inactive version is created
    tsm> q b -inac /path/to/ # show both active and inactive versions
    tsm> d b /path/to/file # delete active version of /path/to/file
    tsm> d b /path/to/file -deltype=inac # delete inactive version
    tsm> d b /path/to/file -deltype=all # delete both active & inactive version
    tsm> a /path/to/file # archive /path/to/file
    tsm> q ar /path/to/file # qerry archive of /path/to/file
    tsm> d ar /path/to/file # delete archive of /path/to/file

*NOTE* The trailing \/ means \/\*. /path/to/directory will be regarded as a regular file instead of a directory. /path/to/directory/ means /path/to/directory/*

Or in batch mode:

    dsmc q b /path/to/
