---
tags: [Qt, Windows, NI-VISA]
---

[NI-VISA library][visa] provides a set of C++ functions to communicate with 
hardwares connected to a PC, while [Qt][] library can be used to create a 
[GUI][] to control those communications. Your [GUI][] written with [Qt][] has 
to be compiled against the [NI-VISA library][visa] to realize it.

I downloaded the [NI-VISA][visa] and installed it in my 64-bit Windows-7 PC.  
The library is located at `C:\Program Files (x86)\IVI 
Foundation\VISA\WinNT\lib\msc\visa32.lib`. Note that there is also a 64-bit 
version of the library: `C:\Program Files (x86)\IVI 
Foundation\VISA\WinNT\Lib_x64\msc\visa64.lib`. But I cannot compile a [Qt] 
project against it. There is also a 32-bit library compiled with [Borland] C++ 
compiler: `C:\Program Files (x86)\IVI Foundation\VISA\WinNT\lib\bc\visa32.lib`.  
Since [Qt][] is compiled with [Microsoft Visual C++][msc], I use **visa32.lib** 
in the **msc** directory instead of the one in the **bc** directory.

I had to install [Qt][] compiled with the 32-bit [Microsoft Visual C++][msc] 
instead of the 64-bit one in the Qt installer. If you already installed [Qt][], 
you can select the 32-bit msvc using the Qt Maintenance Tools:

![enable 32-bit msvc compiler in 
Qt]({{site.exa}}/select-32-bit-msvc-in-qt-installer.png)

and then select the 32-bit compiler for a project if there are other compilers 
available:

![select 32 bit compiler in Qt 
Creator]({{site.exa}}/select-32-bit-compiler-in-Qt-Creator.png)

I had to add the following two lines in my [project file][qp] (the one ended 
with **.pro**):

```make
win32: LIBS += "C:\Program Files (x86)\IVI Foundation\VISA\WinNT\lib\msc\visa32.lib"
win32: INCLUDEPATH += "C:\Program Files (x86)\IVI Foundation\VISA\WinNT\Include"
```

and include the [VISA][visa] header file in my program to use functions 
provided by [NI-VISA library][visa]:

``` cpp
#include <QCoreApplication>
#include <visa.h> // include VISA header file
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // open resource manager
    ViSession rscmng;
    ViStatus stat = viOpenDefaultRM(&rscmng);

    // search for the oscilloscope
    ViChar viFound[VI_FIND_BUFLEN];
    ViUInt32 nFound;
    ViFindList listOfFound;
    stat = viFindRsrc(rscmng, (ViString)"USB?*", &listOfFound, &nFound, viFound);

    // connect to the oscilloscope
    ViSession osc;
    stat = viOpen(rscmng, viFound, VI_NULL, VI_NULL, &osc);

    // communicate
    viPrintf(osc, (ViString)"*IDN?\n");
    char buf[256] = {0};
    viScanf(osc,(ViString)"%t",&buf);
    qDebug()<<buf;

    // close VI sessions
    viClose(osc);
    viClose(rscmng);

    return a.exec();
}
```

Note that I had to explicitly cast strings in the double quotes to 
**ViString**. Otherwise, I would get the following error message:

```
cannot convert argument from 'const char []' to 'ViString'
```

[visa]:https://www.ni.com/visa/
[Qt]:https://www.qt.io/
[GUI]:https://en.wikipedia.org/wiki/Graphical_user_interface
[Borland]:https://en.wikipedia.org/wiki/Borland_C%2B%2B
[msc]:https://en.wikipedia.org/wiki/Visual_C%2B%2B
[qp]:http://doc.qt.io/qt-5/qmake-project-files.html
