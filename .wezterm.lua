local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = "Gruvbox dark, pale (base16)"
config.inactive_pane_hsb = {
    hue = 0.5,
    saturation = 0.5,
    brightness = 0.6,
}
config.font_size = 10.0

-- Set main keybinding key to "CTRL + p"
config.leader = { key='p', mods='CTRL', timeout_milliseconds=1000 }

-- https://wezfurlong.org/wezterm/config/keys.html#raw-key-assignments
-- https://wezfurlong.org/wezterm/config/keys.html#configuring-key-assignments
config.keys = {
    -- Split pane; pane 1 | pane 2
    {
        key = '|',
        mods = 'LEADER|SHIFT',
        action = wezterm.action { SplitHorizontal={domain="CurrentPaneDomain"} },
    },
    -- Split pane
    -- pane 1
    -- -----
    -- pane 2
    {
        key = '-',
        mods = 'LEADER',
        action = wezterm.action { SplitVertical={domain="CurrentPaneDomain"} },
    },

    -- Move between panes
    { key = "h", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "j", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "k", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "l", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},

    -- Copy and paste from clipboard
    { key ="p",  mods="LEADER",    action=wezterm.action.PasteFrom 'Clipboard'},
    { key ="y",  mods="LEADER",    action=wezterm.action.CopyTo 'Clipboard'},

    -- Font sizing
    { key = "+", mods = "CTRL", action=wezterm.action.IncreaseFontSize},
    { key = "-", mods = "CTRL", action=wezterm.action.DecreaseFontSize},
    { key = "0", mods = "CTRL", action=wezterm.action.ResetFontSize},
}

-- TODO: Set up for MacOS
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = {"powershell.exe", "-NoLogo"}
end

return config
