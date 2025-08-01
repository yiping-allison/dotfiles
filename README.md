# Dotfiles

![os](https://img.shields.io/badge/os-Pop!__OS%2022.04-blue) ![chezmoi](https://img.shields.io/badge/chezmoi-%3E%3D%20v2.63.1-orange)

A repository to store dotfiles.

> A _dotfile_ is a hidden folder or file that filesystems do not display (by default) when showing a directory listing.
> They are commonly used for storing user preferences or preserving a state of a utility and are frequently created
> implicitly by using various utilities.

_Wikipedia_

Dotfiles are managed by [Chezmoi](https://www.chezmoi.io/).

Some helpful commands:

```sh
# Initialize dotfiles on a new machine.
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME --ssh

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply yiping-allison --ssh
```

```sh
# Add a file as a template. This lets us have custom values per machine.
chezmoi add --template {{FILE}}
```

```sh
# Diff your working changes with existing
chezmoi diff
```

```sh
# Apply your working changes to dotfiles directory (i.e. Chezmoi source to ~/.config)
chezmoi apply

# Apply your working changes to dotfiles with refreshed externals
chezmoi apply -R
```

```sh
# Teleport to Chezmoi source
chezmoi cd
```

> [!IMPORTANT]
> The code that you push to remote should be the changes in `chezmoi cd`.

See [documentation](https://www.chezmoi.io/user-guide/daily-operations/) for further details.

> [!NOTE]
> `chezmoi` only manages dotfiles for you. You still need to manually move and setup binaries for `niri` if you want to use it.

---

## Niri

[Niri](https://github.com/YaLTeR/niri) is a scrollable Wayland compositor. At minimum (if you want to use it), you need to enable wayland.

```sh
sudo apt install gnome-session
```

This will allow you to choose what type of session you want to log into via GDM (Gnome Display Manager).

Then, allow the GDM to use Wayland.

```sh
sudo vim /etc/gdm3/custom.conf
```

```sh
WaylandEnable=true
```

## Tmux

### Installing Plugins

Plugins are managed by [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).

Initialize new plugins by running `prefix + I`.

## Wezterm

[Wezterm](https://wezfurlong.org/wezterm/index.html) is a cross-platform terminal emulator and multiplexer.

## Man Pages

[Man pages](https://www.mankier.com/) on the web.
