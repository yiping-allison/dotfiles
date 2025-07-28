# Dependencies

## Brightness

Need to install a brightness tool (aka changing display brightness).
We are using [`brightnessctl`](https://github.com/Hummer12007/brightnessctl/tree/master).

Manually configure and install the program.

```sh
git clone https://github.com/Hummer12007/brightnessctl.git
```

Configure.

> [!TIP]
> We need to add permissions to backlight devices for users in the `video` and `input` groups.
>
> You may need to verify that your user is in these groups.
>
> ```sh
> groups $USER
>
> # Adding user to group
> sudo usermod -aG {GROUP_NAME} $USER
> ```
>
> If you updated group permissions, you need to refresh your session (re-login).

```sh
./configure --udev-dir=/etc/udev/rules.d --enable-udev
```

Install.

```sh
sudo make install
```

```sh
# Refresh rules
sudo udevadm control --reload
```

## Cursor

```sh
sudo apt install breeze-cursor-theme
```
