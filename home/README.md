# Dotfile Notes

Notes that may be semi-helpful.

## System

### Theme

[Catppuccin Mocha/Macchiato](https://github.com/catppuccin/catppuccin) and compatible colors.

### Fonts

All fonts are [Nerd Font variants](https://www.nerdfonts.com/font-downloads).

- MesloLG
- FiraCode
- FiraMono

Configuration can be found in [`private_dot_local/.../fonts`](./private_dot_local/share/fonts/).

### Unique dots

I use `Chezmoi` to manage my dots because it supports multiple machines very well.
There are files within [`home`](../home/) that have the `.tmpl` extension. Make sure to check these
files and adjust them to suit your usecase.

For example, in [`dot_wezterm.lua.tmpl`](dot_wezterm.lua.tmpl), there is a block that looks like the following:

```lua
{{ if eq .chezmoi.hostname "fir" -}}
-- Use x11 due to NVIDIA issues with wayland.
-- https://github.com/wezterm/wezterm/issues/3214
config.enable_wayland = false
{{- end }}
```

The block adds a configuration to disable Wayland when the machine's hostname is `fir`.

> [!NOTE]
> `fir` is one of my personal machines.

There may be dots that are disallowed on certain machines.

For example, `niri` is disabled on non-linux machines.

Check [`.chezmoiignore.tmpl`](.chezmoiignore.tmpl) for the updated list.

### SSH

> [!IMPORTANT]
> If you're pulling my configs, this is set to automatically include my public github keys.
> You probably want to remove and replace them with your own.

Configuration can be found in [`private_dot_ssh`](./private_dot_ssh/).

### Packages

Packages are installed using the following methods.

- `apt`
- `.deb`
- `home-manager`
- `brew`

My method of preference is `apt` > `home-manager` > `.deb` > `brew`.

Most developer tooling are installed via `home-manager (nix)` since they do not have the latest releases in `apt`, and I don't want to build them
from source manually.
The nice thing about `nix` is that the system was designed around reproducible builds/environments. Most of the manual steps of building from source
are already handled for you.

The basic `home-manager` profile is already provided in [`dot_config/home-manager`](./dot_config/home-manager/).

You need to install several things before attempting to access tooling managed by `home-manager`.

Install `nix`.

I recommend the [installer maintained by Determinate Systems](https://github.com/DeterminateSystems/nix-installer).

```sh
# Determinate nix
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate

# Upstream nix
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

Install `home-manager`.

```sh
# Flake variant
nix run home-manager/release-25.05 -- init --switch
```

You can activate and build your configuration using the following command.

```sh
home-manager switch
```

Additional `home-manager` documentation can be found [here](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes).

> [!TIP]
> You might have noticed that `oh-my-posh` is still managed by `brew`.
>
> This is not a mistake.
>
> I wanted to have `oh-my-posh` widely available on machine initialization since
> `nix` **is not** automatically installed through chezmoi scripts.

You can find the list of installed packages in [`packages.yaml`](./.chezmoidata/packages.yaml).

### Wallpaper

Found in [`Pictures/wallpapers`](Pictures/wallpapers/).

- [Louis Coyle](https://louie.co.nz/)
- [David Becker](https://unsplash.com/@beckerworks)
- [Catppuccin-Wallpapers](https://github.com/zhichaoh/catppuccin-wallpapers/tree/main)

### Security

You can enable [`firejail`](https://github.com/netblue30/firejail/tree/master?tab=readme-ov-file) to sandbox applications that do not normally run in a sandbox environment.

```sh
# Automatically launch apps in sandbox environments
sudo firecfg
```

Add additional firejail profiles in [`dot_config/firejail`](./dot_config/firejail/).

Additional documentation:

- [Creating Profiles](https://github.com/netblue30/firejail/wiki/Creating-Profiles)
- [Building Custom Profiles](https://firejail.wordpress.com/documentation-2/building-custom-profiles/)

> [!TIP]
> There may be some apps that when closed, do not close the associated firejail parent process.
> You can check currently running processes using:
>
> ```sh
> firejail --list
> ```
>
> Then use:
>
> ```sh
> firejail --shutdown={ID}
> ```
>
> to stop the sandbox.

## Tools

### Tmux

Plugins are managed by [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).

Initialize new plugins by running `prefix + I`.

### Wezterm

[Wezterm](https://wezfurlong.org/wezterm/index.html) is a cross-platform terminal emulator and multiplexer.

Prefix is set to `Ctrl-p`.

### Shell

Main shell used is `zsh`.

Custom configurations can be found in [`dot_omz`](./dot_omz/), [`dot_zsh`](./dot_zsh/), and
[`dot_zshrc`](dot_zshrc.tmpl).

There may be times when you manually update non-custom `zsh` configuration like completions.
Since I am using `oh-my-zsh`, you may need to manually refresh omz's cache.

```sh
# Refresh completion cache after adding to `dot_zsh/completions`.

# Find ZSH_COMPDUMP cache
echo $ZSH_COMPDUMP

# Remove file
rm $ZSH_COMPDUMP

# Reload session
omz reload
```

### `git`

Configuration can be found in [`dot_gitconfig`](dot_gitconfig).

> [!TIP]
> Update name and email.

### VSCode

Configuration can be found in [`dot_config/private_Code/...`](./dot_config/private_Code/User/).

The configuration is symlinked to where VSCode expects the `settings.json` file.

Create a new settings file on initial setup.

```sh
# format
{HOSTNAME}_settings.jsonc
maple_settings.jsonc

# apply the new file
chezmoi apply
```

## Advanced

### Niri

These notes assume you have already installed `niri` and got it working. If you haven't set it up yet, see [docs](../README.md#niri).

> [!IMPORTANT]
> If you are using an NVIDIA card, you need to add a couple extra configuration.
>
> See [updated docs](https://github.com/YaLTeR/niri/wiki/Nvidia).

> [!IMPORTANT]
> If the styling looks off, it may be because it is optimized for my set up.
> You can configure a lot of the styling within [`dot_config/{APP}`](./dot_config/).

#### Niri config

Niri specific configuration can be found in [`dot_config/niri`](./dot_config/niri/).

Create a new file.

```sh
config.kdl_{HOSTNAME}
```

Add new file to [template](./dot_config/niri/config.kdl.tmpl).

#### System

You may need to enable additional tools/functionality depending on the kind of machine you're on.

_**Brightness**_

Install [`brightnessctl`](https://github.com/Hummer12007/brightnessctl/tree/master) if you're running `niri` on a laptop. This will allow you to change your screen's brightness
via keyboard.

> [!TIP]
> Add permissions to backlight devices for users in the `video` and `input` groups.
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
# Refresh rules
sudo udevadm control --reload
```

#### systemd

`systemd` is a system and service manager for linux. We are using `systemd` to manage applications
running in the background such as waybar and mako.

Needed `systemd` configuration can be found [here](./dot_config/systemd/user/).

There is a directory called `niri.service.wants`. This directory contains dependency services that are symlinked to the niri session.

```sh
# Equivalent to:
systemctl --user add-wants niri.service mako.service
...
systemctl --user add-wants niri.service waybar.service
```

Detailed documentation can be found [here](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup).

#### waybar

[`waybar`](https://github.com/Alexays/Waybar) is a Wayland-based status bar.

> [!TIP]
> Waybar uses PostCSS. You might want to install a PostCSS linting tool in your code editor.

Configuration can be found [here](dot_config/waybar/).

You need to create two files on initial setup.

```sh
config.jsonc_{HOSTNAME}
style.css_{HOSTNAME}
```

Make sure to add your hostname in the `*.tmpl` files.

#### wlogout

[`wlogout`](https://github.com/ArtsyMacaw/wlogout) is a Wayland-based logout menu.

> [!TIP]
> There's a critical error that shows up in logs:
>
> ```
> Gtk-CRITICAL **: 11:42:11.407: gtk_label_set_xalign: assertion 'GTK_IS_LABEL (label)' failed
> ```
>
> This is because `wlogout` expect all layout options to be defined even if you don't use them.
> To get rid of this error, keep dummy options in the overridden layout file. You need `label` and `keybind` filled out at minimum.
> Hide these in the UI by adding:
>
> ```css
> #{LABEL} {
>   background: none;
>   border: none;
> }
> ```

> [!TIP]
> If you do hide buttons, you may want to change the `buttons-per-row` option in `wlogout` flags.

#### mako

[`mako`](https://github.com/emersion/mako) is a notification daemon.

Configuration can be found in [`dot_config/mako`](./dot_config/mako/).

Make sure to add your own file per host and update `*.tmpl`.

#### fuzzel

[`fuzzel`](https://codeberg.org/dnkl/fuzzel) is an app launcher.

Configuration can be found in [`dot_config/fuzzel`](./dot_config/fuzzel/).

Make sure to add your own file per host and update `*.tmpl`.

#### Gaming

Some video games have trouble running in non-stacking environments (aka `niri`). You may want to
automatically run steam games in `gamescope`.

I have `gamescope` hooked up with [`steamtinkerlaunch`](https://github.com/sonic2kk/steamtinkerlaunch) so all my games are launched with
custom flags.

```sh
# Install `pacstall`
sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install || wget -q https://pacstall.dev/q/install -O -)"

# Install `steamtinkerlaunch`
pacstall -I steamtinkerlaunch-git

# Add tool to steam
steamtinkerlaunch compat add
```

> [!TIP]
> You need to configure `steam` to use `steamtinkerlaunch` as the default tool.
>
> Steam Settings > Compatibility > Steam Tinker Launch

Configuration files can be found in [`dot_config/steamtinkerlaunch`](./dot_config/steamtinkerlaunch/).

> [!TIP]
> The default config was customized to match my monitor settings. You may need to update these
> values.

```sh
# Equivalent to:
gamescope -f -W 2560 -H 1440 -w 2560 -h 1440 -r 144 --framerate-limit 144 --force-grab-cursor -- %command%
```
