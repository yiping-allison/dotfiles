# Dotfiles

> [!WARNING]
> Migrated to [Gitea](https://gitea.com/allisu/dotfiles).


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
# Apply your working changes to dotfiles directory (i.e. Chezmoi source to ~/.config)
chezmoi apply
```

> [!IMPORTANT]
> The code that you push to `git` remote should be the changes in `chezmoi cd`.

See [documentation](https://www.chezmoi.io/user-guide/daily-operations/) for further details.

---

## Niri

[Niri](https://github.com/YaLTeR/niri) is a scrollable Wayland compositor. If you want to use it, you need to enable [Wayland](https://wayland.freedesktop.org/).

> [!IMPORTANT]
> You need to install and setup `niri` manually. I have included some pre-packaged binaries, but there
> are several that you need to build from source.
>
> See the following READMEs:
> - [Binary setup](bin/README.md)
> - [Dotfile notes](home/README.md#niri)
> - [Misc setup (optional if you're not on NVIDIA)](opt/README.md)

### Enabling Wayland

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

## Man Pages

[Man pages](https://www.mankier.com/) on the web.
