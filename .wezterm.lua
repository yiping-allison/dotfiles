local wezterm = require 'wezterm'

local mux = wezterm.mux
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

    -- Switch to new or existing workspace
    {
        key = 'W',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.PromptInputLine {
            description = wezterm.format {
                { Attribute = { Intensity = 'Bold' } },
                { Foreground = { AnsiColor = 'Fuchsia' } },
                { Text = 'Enter name for new workspace.' },
            },
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                    window:perform_action(
                        wezterm.action.SwitchToWorkspace {
                            name = line,
                        },
                        pane
                    )
                end
            end),
        },
    },

    -- Move between panes
    { key = "h", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Left"} },
    { key = "j", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Down"} },
    { key = "k", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Up"} },
    { key = "l", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Right"} },

    -- Mpve between workspaces
    { key = 'n', mods = 'CTRL', action = wezterm.action.SwitchWorkspaceRelative(1) },
    { key = 'p', mods = 'CTRL', action = wezterm.action.SwitchWorkspaceRelative(-1) },


    -- Copy and paste from clipboard
    { key ="p",  mods="LEADER", action=wezterm.action.PasteFrom 'Clipboard' },
    { key ="y",  mods="LEADER", action=wezterm.action.CopyTo 'Clipboard' },

    -- Font sizing
    { key = "+", mods = "CTRL", action=wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CTRL", action=wezterm.action.DecreaseFontSize },
    { key = "0", mods = "CTRL", action=wezterm.action.ResetFontSize },
}

-- On first startup
wezterm.on('gui-startup', function(cmd)
    -- Allow startup args if present.
    -- `wezterm start -- something`
    local uargs = {}
    if cmd then
        uargs = cmd.args
    else
        -- TODO: Add macOS support
        -- Auto-set shell based on machine
        if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
            uargs = { 'powershell.exe', '-NoLogo' }
        end
    end

    -- Set default workspace
    local tab, pane, window = mux.spawn_window{args=uargs}
    window:gui_window():maximize()
end)

wezterm.on('update-right-status', function(window, pane)
    local date = wezterm.strftime '%Y-%m-%d %H:%M:%S'

    -- Make it italic and underlined
    window:set_right_status(wezterm.format {
        { Attribute = { Underline = 'Single' } },
        { Attribute = { Italic = true } },
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = window:active_workspace() },
        { Text = '   ' },
        { Text = date },
    })
end)

-- TODO: Add macOS support
-- TODO: Look into getting the helper file working in order to set default programs across GUI startup and default panes
-- Defaults for additional panes and windows
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = {"powershell.exe", "-NoLogo"}
end

return config
