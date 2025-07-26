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

## Other dependency

We are using `fuzzel` as the main application launcher. Unfortunately I couldn't pre-package them as a binary since it seems some
dependency was broken (perhaps the linking to `fcft`).

Install [`fcft`](https://codeberg.org/dnkl/fcft).

I used `fcft-3.3.2.tar.gz`.

Extract the files and build.

```sh
meson build --buildtype=release
ninja -C build
ninja -C build test
sudo ninja -C build install
```

Install [`fuzzel`](https://codeberg.org/dnkl/fuzzel).

I used `fuzzel-1.12.0`.

Extract the files and prepare for build.

```sh
mkdir -p bld/release && cd bld/release
```

```sh
# Configure the build
meson --buildtype=release \
    -Denable-cairo=enabled \
    -Dpng-backend=libpng \
    -Dsvg-backend=nanosvg \
    ../..
```

```sh
# Build
ninja
```

```sh
# Test
./fuzzel
```

Make sure to move this binary into `/usr/local/bin`.
