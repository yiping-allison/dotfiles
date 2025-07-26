## User Configs

User configs under `$HOME/.configs`.

## Notes

### Niri

On first setup, you will need to configure your display outputs.

### Waybar

Waybar uses PostCSS. You might want to install a PostCSS linting tool in your code editor.

### WLogout

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
