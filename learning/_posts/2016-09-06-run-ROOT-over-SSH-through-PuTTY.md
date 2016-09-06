---
tags: [ROOT, phys-492/592]
---

The best way to learn ROOT for a regular Windows user is probably to install 
ROOT in Windows, which is [available from the ROOT web 
page](https://root.cern.ch/downloading-root) for ROOT versions before 6. 
However, sooner or later, you will be asked to log into a much more powerful 
server running Linux so that you can use ROOT there to analyze data saved in 
that machine. In that case, you need to [use PuTTY to log into the Linux server 
from your Windows PC]({% post_url 
2016-08-29-connect-to-Linux-from-any-Windows-PC %}).

It is very common that multiple versions of ROOT are installed in a server so 
that analyses done with older versions can be repeated if necessary. They are 
likely to be not installed in the standard location and you will have to do 
some setup before you can call `root`:

``` bash
export ROOTSYS=/path/to/a/specific/root/version/
export PATH=$ROOTSYS/bin:$PATH
export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
```

Save these settings to your `.bashrc` so that you don't have to type it again 
next time you log in. The first line declares an environment variable 
`$ROOTSYS`, which can be used latter. You can give it another name since it is 
not used directly by ROOT. However, it was used by ROOT traditionally, so use 
the same name can be backward compatible. The second line tells SHELL where the 
root executable can be found. The last line is useful when you try to run a 
ROOT program, which needs to use many shared library files provided by ROOT in 
a special location `$ROOTSYS/lib`.
