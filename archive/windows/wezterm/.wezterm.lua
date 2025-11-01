local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = {}

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- key bindings
local keys = {
  { key = "u", mods = "ALT|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "h", mods = "ALT|SHIFT", action = act.ActivateTabRelative(-1) },
  { key = "l", mods = "ALT|SHIFT", action = act.ActivateTabRelative(1) },
  { key = "w", mods = "ALT|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
  { key = "n", mods = "ALT|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "m", mods = "ALT|SHIFT", action = act.MoveTabRelative(1) },
  { key = "f", mods = "ALT|SHIFT", action = act.Search({ CaseInSensitiveString = "" }) },
  { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
  { key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
  { key = "c", mods = "ALT|SHIFT", action = act.ActivateCopyMode },
  { key = "v", mods = "CTRL|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "h", mods = "CTRL|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "w", mods = "CTRL|ALT", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "h", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Down") },
  { key = "h", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "l", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
  { key = "k", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
  { key = "j", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
}

local key_tables = {
  copy_mode = {
    { key = "h", action = act.CopyMode("MoveLeft") },
    { key = "l", action = act.CopyMode("MoveRight") },
    { key = "j", action = act.CopyMode("MoveDown") },
    { key = "k", action = act.CopyMode("MoveUp") },
    { key = "y", action = act.CopyMode("Close") },
    { key = "Enter", action = act.CopyMode("Close") },
  },
}

local hyperlinks = {
  { regex = "\\((\\w+://\\S+)\\)", format = "$1", highlight = 1 },
  { regex = "\\[(\\w+://\\S+)\\]", format = "$1", highlight = 1 },
  { regex = "\\{(\\w+://\\S+)\\}", format = "$1", highlight = 1 },
  { regex = "<(\\w+://\\S+)>", format = "$1", highlight = 1 },
  { regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)", format = "$1", highlight = 1 },
  { regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b", format = "mailto:$0" },
}

config.term = "xterm-256color"
config.front_end = "WebGpu"
config.max_fps = 144
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 300
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.check_for_updates = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 20
config.tab_bar_at_bottom = true
config.font_size = 11
config.font = wezterm.font("Liga SFMono Nerd Font")
config.enable_tab_bar = true
config.window_background_opacity = 0.60
config.initial_cols = 100
config.window_background_image_hsb = { brightness = 0.1 }
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- use Windows PowerShell
config.default_prog = { "powershell.exe", "-NoLogo" }

config.hyperlink_rules = hyperlinks
config.keys = keys
config.key_tables = key_tables

config.colors = {
  tab_bar = {
    background = "none",
    active_tab = { bg_color = "none", fg_color = "#ffffff", underline = "Single" },
    inactive_tab = { bg_color = "none", fg_color = "#888888" },
    inactive_tab_hover = { bg_color = "none", fg_color = "#aaaaaa" },
  },
}

return config