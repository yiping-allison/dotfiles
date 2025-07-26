## File Locations

|          File          |           Destination            |
| :--------------------: | :------------------------------: |
|     `niri.service`     |       `/etc/systemd/user/`       |
| `niri-shutdown.target` |       `/etc/systemd/user/`       |
|  `niri-portals.conf`   | `/usr/share/xdg-desktop-portal/` |
|     `niri.desktop`     |  `/usr/share/wayland-sessions/`  |
|         `niri`         |           `/usr/bin/`            |
|     `niri-session`     |        `/usr/local/bin/`         |

## Shared libraries

> [!IMPORTANT]
> You need to install shared libraries for `niri` to function properly.

Most compatible libraries are available on Ubuntu 22.04.

```sh
sudo apt install -y gcc clang libudev-dev libgbm-dev libxkbcommon-dev libegl1-mesa-dev libwayland-dev libdbus-1-dev libsystemd-dev libseat-dev libpipewire-0.3-dev libpango1.0-dev
```

Two libraries need a little extra work since the latest versions are not available.

- [`libdisplay-info.so`](https://launchpad.net/~savoury1/+archive/ubuntu/display/+build/30619062)
- [`libinput.so`](https://wayland.freedesktop.org/libinput/doc/1.21.0/building.html#verifying-the-install)
