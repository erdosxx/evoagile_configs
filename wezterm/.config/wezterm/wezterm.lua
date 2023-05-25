-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local act = wezterm.action
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "nord"

config.font_size = 13.0
--[[ config.font = wezterm.font("FiraCode Nerd Font") ]]

-- and finally, return the configuration to wezterm
config.xim_im_name = "fcitx"

config.keys = {
	{
		key = "t",
		mods = "SUPER",
		action = act.SpawnTab({
			DomainName = "unix",
		}),
	},
	{
		key = "x",
		mods = "SUPER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "w",
		mods = "SUPER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{ key = "h", mods = "SUPER|CTRL", action = act.MoveTabRelative(-1) },
	{ key = "l", mods = "SUPER|CTRL", action = act.MoveTabRelative(1) },
	{ key = "j", mods = "SUPER|CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "k", mods = "SUPER|CTRL", action = act.ActivateTabRelative(1) },
	{
		key = "h",
		mods = "SUPER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "SUPER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "SUPER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "SUPER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "s",
		mods = "SUPER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "g",
		mods = "SUPER",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 40 },
		}),
	},
	{
		key = "d",
		mods = "SUPER",
		action = wezterm.action.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "f",
		mods = "SUPER",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "Y",
		mods = "SUPER|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "U",
		mods = "SUPER|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "I",
		mods = "SUPER|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "O",
		mods = "SUPER|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "Escape",
		mods = "SUPER",
		action = wezterm.action.ActivateCopyMode,
	},
}

for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "SUPER",
		action = act.ActivateTab(i - 1),
	})
end

return config
