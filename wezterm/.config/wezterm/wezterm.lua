-- Pull in the wezterm API
local wezterm = require("wezterm")

local function check_os_type()
	-- ask LuaJIT first
	if jit then
		return jit.os
	end

	-- Unix, Linux variants
	local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
	if fh then
		osname = fh:read()
	end

	return osname or "Windows"
end

local function get_mod_key()
	if check_os_type() == "GNU/Linux" then
		return "ALT"
	elseif check_os_type() == "Darwin" then
		return "SUPER"
	else
		return "ALT"
	end
end

local os_mod_key = get_mod_key()

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
--[[ config.font = wezterm.font("JetBrainsMono Nerd Font Mono") ]]
--[[ config.font = wezterm.font("FiraCode Nerd Font Mono") ]]
config.font = wezterm.font("JuliaMono Nerd Font Mono")

-- and finally, return the configuration to wezterm
config.xim_im_name = "fcitx"

config.keys = {
	{
		key = "t",
		mods = os_mod_key,
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "x",
		mods = os_mod_key,
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "w",
		mods = os_mod_key,
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "h",
		mods = os_mod_key .. "|CTRL",
		action = act.MoveTabRelative(-1),
	},
	{
		key = "l",
		mods = os_mod_key .. "|CTRL",
		action = act.MoveTabRelative(1),
	},
	{
		key = "j",
		mods = os_mod_key .. "|CTRL",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "k",
		mods = os_mod_key .. "|CTRL",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "h",
		mods = os_mod_key,
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = os_mod_key,
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = os_mod_key,
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = os_mod_key,
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "u",
		mods = os_mod_key,
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "p",
		mods = os_mod_key,
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 40 },
		}),
	},
	{
		key = "d",
		mods = os_mod_key,
		action = wezterm.action.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "f",
		mods = os_mod_key,
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "Y",
		mods = os_mod_key .. "|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "U",
		mods = os_mod_key .. "|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "I",
		mods = os_mod_key .. "|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "O",
		mods = os_mod_key .. "|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "Escape",
		mods = os_mod_key,
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "s",
		mods = os_mod_key,
		action = act.Search({ CaseInSensitiveString = "" }),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "J",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = ")",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ResetFontAndWindowSize,
	},
}

for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = os_mod_key,
		action = act.ActivateTab(i - 1),
	})
end

return config
