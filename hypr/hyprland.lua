--Creator: Luky
--Created: 03.06.2026
--Migrated to lua: 13.06.2026
--Updated: 18.06.2026

----------------
--- Monitors ---
----------------
--Examples:

--hl.monitor({
--  output = "DP-1",
--  mode = "2560x1440@180",
--  position = "0x0",
--  scale = "auto"
--})

--hl.monitor({
--  output = "HDMI-A-1",
--  mode = "1920x01080@240",
--  position = "2560x0",
--  scale = "auto"
--})

--Laptop Example:

--hl.monitor({
--  output = "eDP-1",
--  mode = "1920x01080@144",
--  position = "2560x0",
--  scale = "auto"

------------------------
--- Startup Programs ---
------------------------

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")

-- Nvidia stuff
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("LIBVA_DRIVER_NAME", "nvidia")        

-- ELectron Apps
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- QT themeing
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- xdg desktop stuff
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-----------------
--- Variables ---
-----------------

local mod = "SUPER"
local term = "alacritty"
local files = "thunar"
local appmenu = "wofi"
local browser = "zen-browser"
local screenshot = "grimblast -f save area"

----------------
--- Keybinds ---
----------------

--Applications
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(term))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(files))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd(appmenu))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + S", hl.dsp.exec_cmd(screenshot))
hl.bind(mod .. " + PRINT", hl.dsp.exec_cmd(screenshot))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("hyprpicker"))

--Window Management
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), {mouse = true})
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mod .. " + G", hl.dsp.layout("togglesplit"))

hl.bind(mod .. " + TAB", hl.dsp.window.float({
  action = "toggle"
}))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({
  action = "toggle"
}))

hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + j",  hl.dsp.focus({ direction = "down" }))

--Workspace
for i = 1,10 do
  local key = i % 10 -- 10 is mapped to 0
  hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i}))
  hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i}))
end

--Hyprland
hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd("hyprshutdown"))

--Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind(mod .. " + Z",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),     { locked = true, repeating = true })

--Brightness
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

--Playback Controls
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

--------------------
--- Window Rules ---
--------------------

hl.window_rule({
    match = {
      class = "full"
    },
    fullscreen = true,
})

--------------
--- Design ---
--------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "altgr-intl",
        kb_model   = "",
        kb_options = "lv3:lalt_switch",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,
        accel_profile = flat,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-------------------
--- Look & Feel ---
-------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 3,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgb(102,102,0)", "rgb(51,51,0)"}, angle = 45 },
            inactive_border = "rgb(0,0,0)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 3,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.90,
        inactive_opacity = 0.80,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
