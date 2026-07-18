-- Monitor
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
	hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/wallpaper-cycle.sh")
	hl.exec_cmd("mako")
end)

-- Input
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		numlock_by_default = true,
		natural_scroll = true,
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			tap_to_click = false,
			clickfinger_behavior = false,
		},
	},
	misc = {
		disable_splash_rendering = true,
	},
})

-- Look and feel
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		layout = "dwindle",
	},
	decoration = {
		rounding = 10,
		dim_inactive = true,
		dim_strength = 0.2,
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			new_optimizations = true,
			xray = true,
		},
		shadow = {
			enabled = true,
			range = 8,
			render_power = 3,
			color = "rgba(000000ee)",
		},
	},
})

-- Animations
hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.4, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.5, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.7, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.5, bezier = "linear" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "easeOutQuint" })

-- Environment
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("LIBGL_ALWAYS_SOFTWARE", "1")

-- Keybinds
local mainMod = "SUPER"
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + J", function()
	hl.dispatch("layoutmsg", "togglesplit")
end)
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd('grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%F-%T).png'))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/wallpaper-cycle.sh"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("pcmanfm-qt"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("brightnessctl set 5%-"))

-- Workspace switching
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + LEFT", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + UP", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.window.move({ direction = "d" }))

hl.bind("ALT + LEFT", hl.dsp.focus({ direction = "l" }))
hl.bind("ALT + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind("ALT + UP", hl.dsp.focus({ direction = "u" }))
hl.bind("ALT + DOWN", hl.dsp.focus({ direction = "d" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
