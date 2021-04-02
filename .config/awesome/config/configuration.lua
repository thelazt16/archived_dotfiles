-- ░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░█░█░█▀▄░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
-- ░█░░░█░█░█░█░█▀▀░░█░░█░█░█░█░█▀▄░█▀█░░█░░░█░░█░█░█░█░▀▀█
-- ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

beautiful.font = "mononoki Nerd Font 9"
beautiful.useless_gap = 4
just_backup_gap = 4
beautiful.border_width = 2
beautiful.border_focus = "#bd93f9"
beautiful.border_normal = "#282c34"
beautiful.border_marked = "#FF79C6"
beautiful.systray_icon_spacing = 4
beautiful.tasklist_spacing = 10
beautiful.bg_systray = "#282936"
beautiful.master_width_factor = 0.5
-- beautiful.notification_font
-- beautiful.notification_bg
-- beautiful.notification_fg
beautiful.notification_border_width = 1
beautiful.notification_border_color = "#8BE8FD"
-- beautiful.notification_shape
-- beautiful.notification_opacity
-- beautiful.notification_margin = 50
-- beautiful.notification_width = 400
-- beautiful.notification_height = 150
beautiful.notification_max_width = 400
beautiful.notification_max_height = 150
beautiful.notification_icon_size = 32

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("code") or "code"
editor_cmd = terminal .. " -e " .. editor

-- Define Other Source Stuff
quake = lain.util.quake(({ app = terminal,argname = "--title %s",extra = "--class QuakeDD", visible = true, height = 0.30, width = 1, followtag = true, overlap = false }))
bling = require("bling")
calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
todo_widget = require("awesome-wm-widgets.todo-widget.todo")
-- local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")


-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
    -- awful.layout.suit.floating,
}