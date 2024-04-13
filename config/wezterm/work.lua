-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("MesloLGS Nerd Font")
config.font = wezterm.font("Iosevka Medium")
-- config.font = wezterm.font("Iosevka", {weight="Regular", stretch="Normal", style="Oblique"})
-- config.font = wezterm.font("FiraCode", {weight="Medium", stretch="Normal", style="Normal"})
config.font_size = 10

config.mouse_bindings = {
  -- Disable mouse reporting
  { event={Up={streak=1, button="Left"}},
    mods="NONE",
    action="Nop",
  },
}

config.window_background_opacity = 1
config.audible_bell = "Disabled"
--config.color_scheme = "catppuccin-latte"
--config.color_scheme = 'Gruvbox Light'
config.color_scheme = 'Gruvbox Dark (Gogh)'
--config.color_scheme = 'Gruvbox dark, medium (base16)'
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

config.default_prog = { 'ssh', 'urmishs@dc6-xterm-336', '-Y' }
  
-- Padding
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- and finally, return the configuration to wezterm
return config
