---
layout: note
category: cs
title: svn
subtitle: subversion
---

show changes in a certain period
================================

    $ svn log -r {yyyy-MM-dd}:{yyyy-MM-dd}


tree conflicts
==============
One should use the following command to resolve the tree conflict committing
working dir with svn client 1.6.x

    $ svn resolve --accept working -R .

where . is the directory in conflict.

SSL is not supported
====================

    $ svn --version

will show the repository access (RA) modules which are available. Find out
which one supports https access, neon, surf or dav. Change the option in the
command line

    $ svn up --config-option servers:global:http-library=serf

or change the option permanently in ~/.subversion/servers

    [global]
    http-library=serf

delete locally deleted files from repository
============================================

    $ svn st | grep '^!' | awk '{print $2}' | xargs svn delete --force

svn+ssh
=======

    $ svn ls svn+ssh://usr@host/path/to/svn/repository

svn:ignore
==========

    $ svn pe svn:ignore .
    $ svn up
    $ svn ci -m "added something to ignore list" .

Change executable permissions
=============================

    $ svn proplist file
    $ svn propset svn:executable on file # make it executable
    $ svn propdel svn:executable file # make it not executable
    $ svn ci -m "changed executable property" file

Set keyword property

    $ svn ps svn:keywords "Id" file

Create repository
=================

    $ svnadmin create /path/to/your/repository # create repository
    
    $ mkdir tmpdir
    $ cd tmpdir
    $ mkdir projectA
    $ mkdir projectA/trunk
    $ mkdir projectA/branches
    $ mkdir projectA/tags
    $ mkdir projectB
    $ mkdir projectB/trunk
    $ mkdir projectB/branches
    $ mkdir projectB/tags
    ...
    $ svn import . file:///path/to/repository --message 'Initial repository layout'
    Adding         projectA
    Adding         projectA/trunk
    Adding         projectA/branches
    Adding         projectA/tags
    Adding         projectB
    Adding         projectB/trunk
    Adding         projectB/branches
    Adding         projectB/tags
    ...
    Committed revision 1.
    $ cd ..
    $ rm -rf tmpdir
   
    $ svn ls -v file:///path/to/repository
          1 harry               May 08 21:48 projectA/
          1 harry               May 08 21:48 projectB/
    ...
    $ svn co file:///path/to/repository/projectA
     
    $ svn info projectA
    Path: /linux/path/to/projectA/in/some/other/computer
    URL: svn+ssh://username@former.computer/path/torepository/projectA
    Repository Root: svn+ssh://username@former.computer/path/torepository/
    ...
    $ svn --force rm something  # removes the copy and the thing in repository

Security
========

Passwords are saved as plain text on both the server and the client. This is
because CRAM-MD5 as used in the svn:// protocol requires the plain text
password on both sides. But on the other hand, it gives you secure password
transport on the wire, without the need of SSL/TLS.

svn+ssh does not suffer from this.

Set properties on new files automatically 
=========================================

Subversion keeps for each file and directory a hidden file with property
information. Using properties Subversion keeps track, for example, of the mime
type of a file (.jpg, .png) or if a file is an executable (.sh) or which
keywords should be expanded (e.g. $Id$), etc. To make sure that new files get
a correct set of default properties, you have to set in your
~/.subversion/config file:

    enable-auto-props = yes
    [auto-props]
    *.c = svn:eol-style=LF;svn:keywords=Id
    *.C = svn:eol-style=LF;svn:keywords=Id
    *.cxx = svn:eol-style=LF;svn:keywords=Id
    *.cpp = svn:eol-style=LF;svn:keywords=Id
    *.cc = svn:eol-style=LF;svn:keywords=Id
    *.h = svn:eol-style=LF;svn:keywords=Id
    *.hh = svn:eol-style=LF;svn:keywords=Id
    *.m = svn:eol-style=LF;svn:keywords=Id
    *.mm = svn:eol-style=LF;svn:keywords=Id
    *.f = svn:eol-style=LF;svn:keywords=Id
    *.F = svn:eol-style=LF;svn:keywords=Id
    *.inc = svn:eol-style=LF;svn:keywords=Id
    *.dsp = svn:eol-style=CRLF
    *.dsw = svn:eol-style=CRLF
    *.sh = svn:eol-style=LF;svn:executable;svn:keywords=Id
    *.py = svn:eol-style=LF;svn:executable;svn:keywords=Id
    *.pl = svn:eol-style=LF;svn:executable;svn:keywords=Id
    *.txt = svn:eol-style=LF;svn:keywords=Id
    *.png = svn:mime-type=image/png
    *.jpg = svn:mime-type=image/jpeg
    Makefile = svn:eol-style=LF;svn:keywords=Id
    Makefile.* = svn:eol-style=LF;svn:keywords=Id
    *.mk = svn:eol-style=LF;svn:keywords=Id
    *.cmake = svn:eol-style=LF;svn:keywords=Id

For more on properties and how to change, list and delete them see
http://svnbook.red-bean.com/en/1.4/svn.advanced.props.html.

