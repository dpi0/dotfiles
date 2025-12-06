local wezterm = require("wezterm")
local binds = require("binds")
local hyperlinks = require("hyperlinks")

local config = wezterm.config_builder and wezterm.config_builder() or {}

config.term = "xterm-256color"
config.front_end = "OpenGL"
config.enable_wayland = true
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
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.enable_tab_bar = true
config.window_background_opacity = 0.9
config.prefer_egl = true
config.default_prog = { "zsh" }
config.initial_cols = 100
config.window_background_image_hsb = {
  brightness = 0.1,
}
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Attach imported configs
config.hyperlink_rules = hyperlinks
config.keys = binds.keys
config.key_tables = binds.key_tables

config.colors = {
  tab_bar = {
    background = "none",
    active_tab = {
      bg_color = "none",
      fg_color = "#ffffff",
      underline = "Single",
    },
    inactive_tab = {
      bg_color = "none",
      fg_color = "#888888",
    },
    inactive_tab_hover = {
      bg_color = "none",
      fg_color = "#aaaaaa",
    },
  },
}

return config
