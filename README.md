# Dotfiles

A repository to store dotfiles.

> A _dotfile_ is a hidden folder or file that filesystems do not display (by default) when showing a directory listing.
> They are commonly used for storing user preferences or preserving a state of a utility and are frequently created
> implicitly by using various utilities.

_Wikipedia_

Now using [Chezmoi](https://www.chezmoi.io/) to manage dotfiles!

Some helpful commands:

```sh
# Add a file or file in directory as a template. This lets us have custom values or configurations per machine.
chezmoi add --template {{FILE | DIRECTORY}}
```

```sh
# Diff your working changes with existing
chezmoi diff
```

```sh
# Apply your working changes to dotfiles directory
chezmoi apply
```

```sh
# Teleport to Chezmoi main directory
chezmoi cd
```

> [!IMPORTANT]
> The code that you push to remote should be the changes in `chezmoi cd`.

See [documentation](https://www.chezmoi.io/user-guide/daily-operations/) for further details.

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

## VSCode

[VSCode](https://code.visualstudio.com/) is a lightweight editor.

The VSCode [directory](./vscode/) contains two files:

- `vscode-extensions.txt` - a snapshot of all VSCode extensions installed on the editor
- `settings.json` - custom user configuration for the editor

Create a snapshot of current VSCode extensions.

```sh
code --list-extensions > {FILE_PATH}

code --list-extensions > vscode-extensions.txt
```

Install extensions from a file.

```sh
cat {FILE_PATH} | xargs -n 1 code --install-extension

cat vscode-extensions.txt | xargs -n 1 code --install-extension
```

## Man Pages

[Man pages](https://www.mankier.com/) on the web.
