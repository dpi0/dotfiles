local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

config = {
  term = "xterm-256color" ,
  front_end = "OpenGL",
  max_fps = 144,
  animation_fps = 1,
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 300,
  automatically_reload_config = true,
  window_close_confirmation = "NeverPrompt",
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
  check_for_updates = false,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = false,
  font_size = 10,
  font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
  enable_tab_bar = true,
  window_background_opacity = 0.9,
  prefer_egl = true,
  window_decorations = "NONE | RESIZE",
  default_prog = { "powershell.exe", "-NoLogo" },
  initial_cols = 100,
  -- window_background_image = "C:/dev/misc/berk.png",
  window_background_image_hsb = {
    brightness = 0.1,
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- background = {
  --   {
  --     source = {
  --       File = "/Users/" .. os.getenv("USER") .. "/.config/wezterm/dark-desert.jpg",
  --     },
  --     hsb = {
  --       hue = 1.0,
  --       saturation = 1.02,
  --       brightness = 0.25,
  --     },
  --     -- attachment = { Parallax = 0.3 },
  --     -- width = "100%",
  --     -- height = "100%",
  --   },
  --   {
  --     source = {
  --       Color = "#282c35",
  --     },
  --     width = "100%",
  --     height = "100%",
  --     opacity = 0.55,
  --   },
  -- },
  
  -- -- from: https://akos.ma/blog/adopting-wezterm/
  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = "\\((\\w+://\\S+)\\)",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = "\\[(\\w+://\\S+)\\]",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = "\\{(\\w+://\\S+)\\}",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = "<(\\w+://\\S+)>",
      format = "$1",
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      -- Before
      --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
      --format = '$0',
      -- After
      regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
      format = "$1",
      highlight = 1,
    },
    -- implicit mailto link
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
  },
}

-- binds
config.keys = {
  -- New Tab: Alt+u
  {
    key = "u", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },

  -- Move to Tab on the Left: Alt+h
  {
    key = "h", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1),
  },

  -- Move to Tab on the Right: Alt+l
  {
    key = "l", mods = "ALT", action = wezterm.action.ActivateTabRelative(1),
  },

  -- Close Current Tab: Alt+w
  {
    key = "w", mods = "ALT", action = wezterm.action.CloseCurrentTab({ confirm = true }),
  },

  -- Search (Start Search Mode): Alt+f
  {
    key = "f", mods = "ALT", action = wezterm.action.Search({ CaseInSensitiveString = "" }),
  },

    -- Clipboard Copy/Paste
  {
    key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard"),
  },
  {
    key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard"),
  },

    -- Toggle Fullscreen
  {
    key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen,
  },

  -- Enter Copy Mode
  {
    key = "c", mods = "ALT|SHIFT", action = wezterm.action.ActivateCopyMode,
  },

    -- Pane Management
  {
    key = "v", mods = "CTRL|ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "h", mods = "CTRL|ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "w", mods = "CTRL|ALT", action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },

    -- Pane Navigation
  {
    key = "h", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "l", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "k", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "j", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneDirection("Down"),
  },

  -- Resize Panes
  {
    key = "h", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "l", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
  {
    key = "k", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "j", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },
}

-- custom bindings while in copy mode
config.key_tables = {
  copy_mode = {
    { key = "h", action = wezterm.action.CopyMode("MoveLeft") },
    { key = "l", action = wezterm.action.CopyMode("MoveRight") },
    { key = "j", action = wezterm.action.CopyMode("MoveDown") },
    { key = "k", action = wezterm.action.CopyMode("MoveUp") },
    { key = "y", action = wezterm.action.CopyMode("Close") },
    { key = "Enter", action = wezterm.action.CopyMode("Close") },
  },
}

return config

-- sources:
-- https://github.com/hendrikmi/dotfiles/blob/main/wezterm/config.lua
-- https://github.com/vimichael/make-windows-pretty/blob/main/.wezterm.lua
