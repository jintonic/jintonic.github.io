---
layout: note
category: cs
title: WSL
subtitle: Windows Subsystem for Linux
---

## Terminate a WSL

In a powershell, use the following commands to list and terminate a WSL distribution.

```
wsl -l -v
wsl -t <distroName>
```

## Windows File Permission
Permissions of files in `/mnt/c` are 777 by default unless you add the following in `/etc/wsl.conf` inside a specific WSL:

```
[automount]
# https://www.turek.dev/posts/fix-wsl-file-permissions
# https://learn.microsoft.com/en-us/windows/wsl/file-permissions
# fmask=111 -> 644, including explorer.exe
# fmask=11 --> 744, which makes explorer.exe executable
options = "metadata,umask=22,fmask=11"
```

## Locale

The default locale of Debian WSL is *en_US.UTF-8*, and *C.UTF-8* for Ubuntu and AlmaLinux.

