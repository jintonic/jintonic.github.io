---
layout: note
category: cs
title: Arch Linux
---

# Printing

According to the [Arch][] [Linux][] [Wiki][], the first step is to install [CUPS][]:

```sh
$ pacman -S cups cups-pdf
```

The second is to enable the server:

```sh
$ systemctl enable org.cups.cupsd.service
```

The third is to install the driver for the printer. Common ones are listed [here](https://wiki.archlinux.org/index.php/CUPS/Printer-specific_problems).

The forth is to add a printer using the [CUPS][] web UI: <http://localhost:631>. According to [this post](https://forums.gentoo.org/viewtopic-t-1001972-start-0.html), to install a network printer, one should select `ipp` (internet protocol) and use the following url:

```
socket://192.168.1.xxx
```

Note that you should ping the IP address before the action above to make sure that you can connect to the printer.

[Arch]:https://www.archlinux.org/
[Linux]:https://en.wikipedia.org/wiki/Linux
[Wiki]:https://wiki.archlinux.org/index.php/CUPS
[CUPS]:https://www.cups.org/

# Sound

[ALSA][] is included in the kernel. The user just needs to install `alsa-utils`.

```sh
# list playback devices
$ aplay -l
# list recording devices
$ arecord -l
```

`alsamixer` provides a GUI using ncurses. `amixer` is a pure command-line tool and can be used together with [xbindkeys][] to enable multimedia keys on a keyboard.

[ALSA]: https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture
[xbindkeys]: https://wiki.archlinux.org/index.php/Xbindkeys

## debug microphone

```sh
$ arecord --duration=5 --format=dat test-mic.wav
$ aplay test-mic.wav

# or show sound level in terminal. User it together with alsamixer to tune boost
$ arecord -vv --format=dat /dev/null
```

# Input method

```sh
$ pacman -S ibus
$ ibus-setup
$ ibus-daemon --xim -d
```
