---@type Wezterm
local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.log_info("reloading")

require("tabs").setup(config)
require("mouse").setup(config)

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font_size = 11
-- config.font = wezterm.font({ family = "JetBrains Mono" })
-- config.font = wezterm.font("MesloLGS Nerd Font")
-- config.font = wezterm.font("Iosevka", {weight="Regular", stretch="Normal", style="Oblique"})
-- config.font = wezterm.font({family = "Iosevka", {weight="Regular", stretch="Normal", style="Normal"}})
-- config.font = wezterm.font("FiraCode", {weight="Medium", stretch="Normal", style="Normal"})
-- config.font = wezterm.font({ family = "Iosevka Medium" })
config.font = wezterm.font({ family = "Iosevka Medium Extended" })
-- config.font = wezterm.font({ family = "Fira Code" })
config.bold_brightens_ansi_colors = true
config.font_rules = {
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
  },
  {
    italic = true,
    intensity = "Half",
    font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
  },
  {
    italic = true,
    intensity = "Normal",
    font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
  },
}

config.mouse_bindings = {
  -- Disable mouse reporting
  { event={Up={streak=1, button="Left"}},
    mods="NONE",
    action="Nop",
  },
}

config.initial_rows = 50
config.initial_cols = 180

config.window_background_opacity = 1
config.audible_bell = "Disabled"
--config.color_scheme = "catppuccin-latte"
-- config.color_scheme = 'Gruvbox Light'
config.color_scheme = 'Gruvbox Dark (Gogh)'
-- Tab Bar Options
-- config.use_fancy_tab_bar = false
-- config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
-- config.show_tab_index_in_tab_bar = false
-- config.disable_default_key_bindings = true
config.selection_word_boundary = '{}[]()<>"\'`,;:&?*|├ │─┤┼'
config.keys = {
    {
        key = 'F11',
        action = wezterm.action.ToggleFullScreen,
    },
    {
      key = 'Escape',
      action = wezterm.action.DisableDefaultAssignment,
    },
  }

-- config.default_prog = { 'zellij', 'attach', 'personal', '-c' }
-- config.default_prog = { 'ssh', 'urmishs@dc6-xterm-336', '-Y' }

-- Padding
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.scrollback_lines = 10000

return config --[[@as Wezterm]]
