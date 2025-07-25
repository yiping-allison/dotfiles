# User Systemd

## Dependencies

### `apt`

- swayidle
- swaybg
- policykit-1-gnome (gnome-polkit-agent)
- libnotify-bin (mako dependency)
- waybar* (we will be replacing this binary)

### Pre-built binaries

- [`niri`](../../../bin/niri/)
- [`mako`](../../../bin/)
- [`xwayland-satellite`](../../../bin/)
- [`waybar`](../../../bin/)

## Symlinks

`niri` requires several dependency services to function properly. The dependencies have been symlinked to the niri session.

```sh
systemctl --user add-wants niri.service mako.service
...
systemctl --user add-wants niri.service waybar.service
```

Detailed documentation can be found [here](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup).
