-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- this is for the scrollback lines
config.enable_wayland = false

config.scrollback_lines = 10000

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = "Macintosh (base16)"
--config.color_scheme = "Batman"

config.color_scheme = "Galizur"
--config.color_scheme = "Atelierforest (dark) (terminal.sexy)"
--config.color_scheme = "catppuccin-mocha"

--config.color_scheme = "Belge (terminal.sexy)"

config.use_fancy_tab_bar = false
config.inactive_pane_hsb = {
	saturation = 0.6,
	brightness = 0.5,
}

--config.hide_tab_bar_if_only_one_tab = true

--config.font = wezterm.font("Fira Code Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font = wezterm.font("Hack Nerd Font", { stretch = "Normal" }) -- /usr/share/fonts/TTF/HackNerdFont-BoldItalic.ttf, FontConfig

config.font_size = 11
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 0.6

-- timeout_milliseconds defaults to 1000 and can be omitted
-- for this example use `setxkbmap -option caps:none` in your terminal.
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "|",
		mods = "SHIFT|CTRL",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "_",
		mods = "SHIFT|CTRL",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "LeftArrow",
		mods = "ALT|CTRL",
		action = wezterm.action({ ActivatePaneDirection = "Left" }),
	},
	{
		key = "RightArrow",
		mods = "ALT|CTRL",
		action = wezterm.action({ ActivatePaneDirection = "Right" }),
	},
	{
		key = "UpArrow",
		mods = "ALT|CTRL",
		action = wezterm.action({ ActivatePaneDirection = "Up" }),
	},
	{
		key = "DownArrow",
		mods = "ALT|CTRL",
		action = wezterm.action({ ActivatePaneDirection = "Down" }),
	},
	{
		key = "RightArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
	},
	{
		key = "LeftArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
	},
	{
		key = "DownArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
	},
	{
		key = "UpArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
	},
	{
		key = "n",
		mods = "WIN|CTRL",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "x",
		mods = "WIN|ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "X",
		mods = "WIN|SHIFT|CTRL",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "LeftArrow",
		mods = "ALT",
		action = wezterm.action({ ActivateTabRelative = -1 }),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = wezterm.action({ ActivateTabRelative = 1 }),
	},
}
-- and finally, return the configuration to wezterm
return config
