---
tags: [ROOT, phys-492/592]
---

The best way to [learn ROOT for a regular Windows user]({% post_url learning/2015-06-29-learn-ROOT-on-Windows %}) is probably to install ROOT in Windows, which is [available from the ROOT web page](https://root.cern.ch/downloading-root) for ROOT versions before 6. However, sooner or later, you will be asked to log into a much more powerful server running Linux so that you can use ROOT there to analyze data saved in that machine. In that case, you need to [use PuTTY to log into the Linux server from your Windows PC]({% post_url learning/2016-08-29-connect-to-Linux-from-any-Windows-PC %}).

It is very common that multiple versions of ROOT are installed in a server so that analyses done with older versions can be repeated if necessary. They are likely to be not installed in the standard location and you will have to do some setup before you can call `root`:

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
a special location `$ROOTSYS/lib`. In our example, the library files are in 
`$ROOTSYS/lib`. I found in quite some places they are in `$ROOTSYS/lib/root`. 
So please go to that directory and check if you can find ROOT library files in 
it. One example would be `libCore.so`. You should be able to find it in the 
library directory.

Now you should be able to call `root` after your command prompt:

``` bash
$ root -h # print options you can give to root
$ root -b # run root in command line mode, no graphic is needed
$ root # this gives a complain if you don't have an X-window running
```

If you have not heard about [X11][] or [X Window System][X11], you will have to 
run `root` with the `-b` option, which is used to tell ROOT not to used the 
graphic interface provided by [X11][]. Now you should be able to see the ROOT 
command prompt instead of the SHELL command prompt:

``` bash
$ root -b # we are still in SHELL
ROOT [0] 1+1 // now we are in ROOT
(const int)2
ROOT [1] .q
```

Type `.q` to quit ROOT. *NOTE:* it is `.q` not just `q`! You can type C++ code 
after a ROOT prompt:

``` c++
ROOT [0] int a=1
ROOT [1] float b=log(a);
ROOT [2] cout<<b<<endl
```

You can ignore the semicolon sign `;` after each line. This is not acceptable 
in standard C/C++, but is OK after a ROOT prompt to save some typing. You can 
also write everything in a text file with a suffix of `.C`, for example, 
`test.C`. It is called a ROOT macro or a ROOT script. Write the following code 
into `test.C`:

```c++
void test(float input)
{
   float output = log(input);
   cout<<output<<endl;
}
```

Save and quit and then you can run it this way:

``` bash
$ root -b -q 'test.C(1)'
```

The `-q` option tells ROOT to quit after executing the function. The single 
quote sign `'` is to prevent `bash` to interpret the parentheses  You can also 
run the script inside ROOT:

``` bash
$ root -b
ROOT [0] .x test.C(10)
ROOT [1] .q
```

Notice that you don't need to use the single quotes anymore once you are in ROOT.

[X11]:https://en.wikipedia.org/wiki/X_Window_System
