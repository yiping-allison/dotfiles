# Binaries

A collection of binaries that I have already built (and tested working) on one machine.

Adding it to git because I have multiple machines, and I don't want to bother re-building again.

> [!IMPORTANT]
> Built for PopOS 22.04

The binaries are compressed. Use the command below to uncompress them.

```sh
tar -xvf {PROGRAM}.tar.xz
```

> [!TIP]
> `fuzzel`, `mako`, `makoctl`, `swaylock`, and `xwayland-satellite` reside in `/usr/local/bin/`.

> [!TIP]
> `waybar` resides in `/usr/bin/`.

> [!IMPORTANT] > `waybar` provides its own `systemd` file upon installation. Since we are overriding the existing waybar binary, we don't have to provide a new or updated version.
> If you, however, didn't pre-install waybar, you can create it using the following:
>
> ```md
> [Unit]
> Description=Highly customizable Wayland bar for Sway and Wlroots based compositors.
> Documentation=https://github.com/Alexays/Waybar/wiki/
> PartOf=graphical-session.target
> After=graphical-session.target
> Requisite=graphical-session.target
>
> [Service]
> ExecStart=/usr/bin/waybar
> ExecReload=kill -SIGUSR2 $MAINPID
> Restart=on-failure
> ```
>
> Place this file under `/usr/lib/systemd/user/`.
