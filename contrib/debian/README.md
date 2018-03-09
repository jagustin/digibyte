
Debian
====================
This directory contains files used to package lekcoind/lekcoin-qt
for Debian-based Linux systems. If you compile lekcoind/lekcoin-qt yourself, there are some useful files here.

## lekcoin: URI support ##


lekcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install lekcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your lekcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/lekcoin128.png` to `/usr/share/pixmaps`

lekcoin-qt.protocol (KDE)

