-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.font = wezterm.font("MesloLGS NF")
config.font_size = 14

config.color_scheme = "Catppuccin Mocha"

config.window_decorations = "RESIZE"

-- Finally, return the configuration to wezterm:
return config
