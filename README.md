About
=====

A collection of "Hello World" programs for various X11 Widget toolkits.

| Executable    | Notes                                    |
| ------------- | ---------------------------------------- |
| client\_xaw   | Xaw (X Athena Widgets and Xt Intrinsics) |
| client\_forms | XForms library                           |
| client\_xv    | XView / OPEN LOOK library                |
| client\_w     | WINGs / WindowMaker library              |
| client\_glfw  | GL Framework library                     |

Prerequisites
=============
* NOTE: don't install packges unless the build fails.

- client\_xaw:

```
debian/ubuntu: apt-get install libxt-dev libxaw7-dev
arch: pacman -S libxaw
fedora: dnf install libXt-devel libXaw-devel
```

- client\_forms:

```
debian/ubuntu: apt-get install libforms-dev
arch: http://aur.archlinux.org/packages/xforms/
fedora: dnf install xforms-devel
```

- client\_xv:

```
debian/ubuntu: apt-get install xviewg-dev xview-examples xview-clients
arch: N/A
```

- client\_w:

```
debian/ubuntu: apt-get install libwings-dev
arch: apt-get install windowmaker
fedora: dnf install WINGs-devel
```

- client\_glfw:
```
	debian/ubuntu: apt-get install libglfw-dev
	arch: TBD
```

Building
========

```
make all
```

BUGS
====

* client\_xv crashes, This is likely due to due to known issue
  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=320155
  Error output:
System warning: No such file or directory, call to alloc function returned NULL pointer

* client\_w crashes, WINGs seems extremely broken on Ubuntu.
  Error output:
client\_w: /build/buildd/wmaker-0.92.0/WINGs/proplist.c:916: WMCreatePLString: Assertion `str!=((void *)0)' failed.

