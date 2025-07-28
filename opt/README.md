Instructions for manually installing apps (because flatpak versions are breaking).

## Zen Browser

> [!TIP]
> You only need to install Zen manually if you're on an NVIDIA card (graphics connection issue in logs).
> Flatpak version is working fine on my non-NVIDIA machine.

1.  Install Zen browser manually from the [website](https://zen-browser.app/download/).
2.  Extract files, etc.
3.  Move the extracted files into the directory you want.
    ```sh
    sudo mv zen /opt/
    ```
4.  Create a symbolic link to the binary file.
    ```sh
    sudo ln -s /opt/zen/{BINARY} /usr/local/bin/zen
    ```
5.  Create a desktop shortcut or launcher for Zen.
    ```sh
    # vi ~/.local/share/applications/zen.desktop
    ```

> [!NOTE]
> Use `Icon=zen-browser` if [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) is installed. If you need to verify the icon name, you can view them by traversing the Papirus icon
> directory.
>
> `usr/share/icons/Papirus`

> [!NOTE]
> `StartupWMClass=zen` is needed in order to resolve the app's instance window with a custom launcher icon.
> Use `xprop | grep WM_CLASS` (on X11 systems) and click on the Zen browser window to view the name.
>
> ```sh
> WM_CLASS(STRING) = "zen-browser", "zen"
> ```
>
> You want the second string.
