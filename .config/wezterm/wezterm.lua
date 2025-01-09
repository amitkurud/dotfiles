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

config.scrollback_lines = 10000000

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = "Macintosh (base16)"
--config.color_scheme = "Batman"
--config.color_scheme = "Galizur"
--config.color_scheme = "Atelierforest (dark) (terminal.sexy)"
--config.color_scheme = "catppuccin"
--config.color_scheme = "Github Dark (Gogh)"
--config.color_scheme = "Belge (terminal.sexy)"
--config.color_scheme = "Catppuccin Mocha"

--config.color_scheme = "Astrodark (Gogh)"
config.color_scheme = "One Half Black (Gogh)"
config.use_fancy_tab_bar = false
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.5,
}
config.window_decorations = "TITLE | RESIZE"
config.hide_tab_bar_if_only_one_tab = true

--config.font = wezterm.font("Fira Code Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font = wezterm.font("Hack Nerd Font", { stretch = "Normal" }) -- /usr/share/fonts/TTF/HackNerdFont-BoldItalic.ttf, FontConfig

config.font_size = 11
config.window_padding = {
	left = 5,
	right = 5,
	top = 10,
	bottom = 10,
}
config.window_background_opacity = 0.8

-- timeout_milliseconds defaults to 1000 and can be omitted
-- for this example use `setxkbmap -option caps:none` in your terminal.
config.leader = { key = "`", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "LeftArrow",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Left" }),
	},
	{
		key = "RightArrow",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Right" }),
	},
	{
		key = "UpArrow",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Up" }),
	},
	{
		key = "DownArrow",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Down" }),
	},
	-- {
	-- 	key = "RightArrow",
	-- 	mods = "LEADER|ALT",
	-- 	action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
	-- },
	-- {
	-- 	key = "LeftArrow",
	-- 	mods = "ALT|SHIFT",
	-- 	action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
	-- },
	-- {
	-- 	key = "DownArrow",
	-- 	mods = "ALT|SHIFT",
	-- 	action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
	-- },
	-- {
	-- 	key = "UpArrow",
	-- 	mods = "ALT|SHIFT",
	-- 	action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
	-- },
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "X",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "LeftArrow",
		mods = "LEADER|ALT",
		action = wezterm.action({ ActivateTabRelative = -1 }),
	},
	{
		key = "RightArrow",
		mods = "LEADER|ALT",
		action = wezterm.action({ ActivateTabRelative = 1 }),
	},
}
-- and finally, return the configuration to wezterm
return config
