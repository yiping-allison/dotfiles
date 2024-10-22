# Dotfiles

A repository to store dotfiles.

 > A _dotfile_ is a hidden folder or file that filesystems do not display (by default) when showing a directory listing.
They are commonly used for storing user preferences or preserving a state of a utility and are frequently created
implicitly by using various utilities.

_Wikipedia_


---

## Tmux

### Installing Plugins

Plugins are managed by [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).

Initialize new plugins by running `prefix + I`.


## Wezterm

[Wezterm](https://wezfurlong.org/wezterm/index.html) is a cross-platform terminal emulator and multiplexer.


## VSCode

[VSCode](https://code.visualstudio.com/) is a lightweight editor.

The VSCode [directory](./vscode/) contains two files:

* `vscode-extensions.txt` - a snapshot of all VSCode extensions installed on the editor
* `settings.json` - custom user configuration for the editor

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
