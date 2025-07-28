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

> [!TIP]
> User settings are usually found under `~/.config/Code/User/settings.json`.
