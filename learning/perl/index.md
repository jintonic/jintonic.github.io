---
layout: note
category: cs
title: perl
---

# Install perl module in home directory

- search, download, unpack perl's local::lib module [1]
- cd unpacked local-lib directory
- run [2]

```sh
perl Makefile.PL --bootstrap=/prefix
make test && make install
echo 'eval $(perl -I/prefix/lib/perl5 -Mlocal::lib=/prefix)' >>~/.bashrc
cpan App::cpanminus # say yes if you face some questions
cpanm Module::name
```

[1]: http://search.cpan.org/dist/local-lib/lib/local/lib.pm#The_bootstrapping_technique
[2]: http://www.cpan.org/modules/INSTALL.html

# mimeopen

```sh
cpanm File::MimeInfo
```

# find out perl module path and version

```sh
perldoc -lm List::Util
/usr/lib/perl/5.10/List/Util.pm
perldoc -m Moose | grep VERSION
```
The -l switch instructs perldoc to display the path for the file, instead of the POD itself. The -m switch instructs perldoc to display the entire file for a given module, even if it doesn't have a POD.

# interactive session

```sh
perl -de1
print $^O
q
```
