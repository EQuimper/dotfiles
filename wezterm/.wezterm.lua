-- Pull in the wezterm API
local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

local config = wezterm.config_builder()
workspace_switcher.apply_to_config(config)

config.font_size = 13

local function read_scheme()
	local f = io.open(os.getenv("HOME") .. "/.config/theme/current", "r")
	if not f then
		return "Catppuccin Mocha"
	end
	local v = f:read("*l")
	f:close()
	return v == "light" and "Catppuccin Latte" or "Catppuccin Mocha"
end

config.color_scheme = read_scheme()
wezterm.add_to_config_reload_watch_list(os.getenv("HOME") .. "/.config/theme/current")

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
-- config.window_background_opacity = 0.80
config.macos_window_background_blur = 6

config.enable_tab_bar = false

config.leader = {
	key = "a",
	mods = "CMD",
	timeout_milliseconds = 1000,
}

config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({
			confirm = true,
		}),
	},
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({
			key = "a",
			mods = "CTRL",
		}),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.SendString("clear\n"),
	},
	{
		key = "p",
		mods = "CMD",
		action = wezterm.action.PaneSelect({
			alphabet = "1234567890",
		}),
	},
	{
		key = "s",
		mods = "LEADER",
		action = workspace_switcher.switch_workspace(),
	},
	{
		key = "S",
		mods = "LEADER",
		action = workspace_switcher.switch_to_prev_workspace(),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter name for new workspace",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						wezterm.action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Rename current tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	}, -- activate copy mode or vim mode
	{
		key = "Enter",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
}

return config
