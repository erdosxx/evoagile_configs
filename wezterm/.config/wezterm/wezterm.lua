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
config.keys = {
	{
		key = "t",
		mods = "ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	-- Create a new tab in the default domain
	{ key = "t", mods = "ALT", action = act.SpawnTab("DefaultDomain") },
	-- Create a tab in a named domain
	{
		key = "t",
		mods = "ALT",
		action = act.SpawnTab({
			DomainName = "unix",
		}),
	},
	{
		key = "w",
		mods = "ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
}

for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
	-- F1 through F8 to activate that tab
	table.insert(config.keys, {
		key = "F" .. tostring(i),
		action = act.ActivateTab(i - 1),
	})
end

return config
