---
layout: note
category: cs
title: Arch Linux
---

# Disk partition

[UEFI][] is replacing [BIOS][] since 2010. If one has a [UEFI][] enabled machine, a small partition needs to be created in the hard disk to save a boot loader image in it. The recommended size is about 512 M for duel boot machines. Most likely, there is already such a partition in the disk if there is Windows in the machine pre-installed.

SWAP is still needed. Search on Google to determine the size of it. For a machine that has a 16 G of memory, the SWAP partition size would be 20 G to ensure a stable hibernation.

One can hence use `fdisk` to create three partitions for a machine that has only Linux in it:

- primary partition 1 in efi format with a size of 512 M
- primary partition 2 in swap format with a size of 20 G
- primary partition 3 in linux format that uses all the rest of the disk

[UEFI]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface
[BIOS]: https://en.wikipedia.org/wiki/BIOS

# Wireless

According to the [Arch][] [Linux][] [Wiki page on wireless configurations](https://wiki.archlinux.org/index.php/Network_configuration/Wireless),

```sh
$ lspci -k # check driver
$ ip link # list available network interfaces
$ ip link set wlp2s0 up # activate wireless interface named wlp2s0
$ ip link show wlp2s0 # show status of the interface named wlp2s0
$ iw dev wlp2s0 scan # show networks detected by wlp2s0
```

[These commands replace old ones, such as `ifconfig`, etc](https://dougvitale.wordpress.com/2011/12/21/deprecated-linux-networking-commands-and-their-replacements/). `iw` needs to be installed.

Authentication has to be done using [wpa_supplicant][].

[wpa_supplicant]: https://wiki.archlinux.org/index.php/Wpa_supplicant

Another way is to install `networkmanager` and `gnome` and run the following command:

```sh
$ systemctl enable NetworkManager.service
```

to let a service run on the background all the time so that a user can use some GUI to setup the network. This is noticeably easy. If one has a not-too-old machine, this should be a preferred method.

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

# AUR

## makepkg

Create `~/.makepkg.conf` with the following contents:

```sh
PKGEXT=.kpg.tar
```

to disable compression of the package files after build.
