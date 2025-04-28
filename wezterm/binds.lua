local wezterm = require("wezterm")
local act = wezterm.action

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

return {
  keys = keys,
  key_tables = key_tables,
}
