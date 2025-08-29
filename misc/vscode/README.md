# VSCode and VSCodium

[VSCode](https://code.visualstudio.com/) is a lightweight editor.
You can also choose to use [VSCodium](https://vscodium.com/), which is the telemetry-less and open-source version of VSCode.

- `vscode-extensions.txt` - a snapshot of all VSCode extensions
- `codium-extensions.txt` - a snapshot of all VSCodium extensions

> [!IMPORTANT]
> Extensions are not fully shared between VSCode and VSCodium. This is because some extensions
> provided within VSCode have proprietary licenses (usually from Microsoft).
>
> Since VSCodium is fully open-source, it cannot use extensions that are not.
>
> One of the major differences is the Python language server support. `Pylance` is a proprietary product, so
> we swapped that out with `BasedPyright` and `ruff` instead.
>
> You can find more info on extensions compatibility [here](https://github.com/VSCodium/vscodium/blob/master/docs/extensions-compatibility.md).

## CLI

You can manage your extensions through the command-line rather than installing everything manually.

> [!TIP]
> This is assuming that you already have the editor command in your PATH.
>
> You can find more info [here](https://github.com/VSCodium/vscodium/blob/master/docs/usage.md#how-do-i-open-vscodium-from-the-terminal).

The commands between `VSCode` and `VSCodium` are the same. You just need to call the right binary.

```sh
# VSCode
code
```

```sh
# VSCodium
codium
```

### Create a snapshot

Create a snapshot of currently installed extensions.

```sh
# VSCode
{BINARY} --list-extensions > {FILE_PATH}
```

### Install extensions

Install extensions from a file.

```sh
cat {FILE_PATH} | xargs -n 1 {BINARY} --install-extension
```
