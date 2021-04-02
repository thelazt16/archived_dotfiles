-- ░█░░░▀█▀░█▀▄░█▀▄░█▀█░█▀▄░█░█
-- ░█░░░░█░░█▀▄░█▀▄░█▀█░█▀▄░░█░
-- ░▀▀▀░▀▀▀░▀▀░░▀░▀░▀░▀░▀░▀░░▀░

-- Load modules from luarocks
-- pcall(require, "luarocks.loader")

-- Standard awesome library
local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Other library
local lain = require("lain")
local vicious = require("vicious")

-- Enable hotkeys help widget
require("awful.hotkeys_popup.keys")


-- ░█▀▀░█▀▄░█▀▄░█▀█░█▀▄░░░█░█░█▀█░█▀█░█▀▄░█░░░▀█▀░█▀█░█▀▀
-- ░█▀▀░█▀▄░█▀▄░█░█░█▀▄░░░█▀█░█▀█░█░█░█░█░█░░░░█░░█░█░█░█
-- ░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░░▀░▀░▀░▀░▀░▀░▀▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

-- ░█░█░█▀█░█▀▄░▀█▀░█▀█░█▀▄░█░░░█▀▀░█▀▀
-- ░▀▄▀░█▀█░█▀▄░░█░░█▀█░█▀▄░█░░░█▀▀░▀▀█
-- ░░▀░░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀░░▀▀▀░▀▀▀░▀▀▀

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

beautiful.font = "mononoki Nerd Font 9"
beautiful.useless_gap = 4
just_backup_gap = 4
beautiful.border_width = 1
beautiful.border_focus = "#8BE8FD"
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

-- ░█▄█░█▀▀░█▀█░█░█
-- ░█░█░█▀▀░█░█░█░█
-- ░▀░▀░▀▀▀░▀░▀░▀▀▀

-- Create a launcher widget and a main menu
myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
 }

 mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                     { "open terminal", terminal }
                                   }
                         })

 -- Menubar configuration
 menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- ░█░█░▀█▀░█▀▄░█▀█░█▀▄
-- ░█▄█░░█░░█▀▄░█▀█░█▀▄
-- ░▀░▀░▀▀▀░▀▀░░▀░▀░▀░▀

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

-- VICIUOUS WIDGET
memwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, "<span color='#F4F99D'>  $2GB</span>", 30)

cpuwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.cpu)
vicious.register(cpuwidget, vicious.widgets.cpu, "<span color='#8BE8FD'><span font='mononoki Nerd Font 10'></span> $1%</span>", 5)

netwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.net)
vicious.register(
    netwidget, 
    vicious.widgets.net, 
    function (widget, args)
        rate = tonumber(args["{wlan0 down_kb}"])
        if rate <= 1000 then
            return ("<span color='#5AF78D'> " .. args["{wlan0 down_kb}"] .. "KB/s</span>")
        else
            mb_rate = math.floor(((rate/1000)/10)*10)
            return ("<span color='#5AF78D'> " .. mb_rate .. "MB/s</span>")
        end
    end, 
    2
)

wifiwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.wifi)
vicious.register(wifiwidget, vicious.widgets.wifi, "<span color='#5AF78D'>  ${ssid}</span>", 300, "wlan0")

thermalwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.thermal)
vicious.register(thermalwidget, vicious.widgets.thermal, "<span color='#FF6E67'> $1°C</span>", 30, "thermal_zone0")

datewidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.date)
vicious.register(datewidget, vicious.widgets.date, "<span color='#CAA8FA'> %a, %d %b %H:%M</span>")
-- vicious.register(datewidget, vicious.widgets.date, "<span color='#CAA8FA'> %a, %d %b %H:%M</span>")

batterywidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.bat)
vicious.register(
    batterywidget,
    vicious.widgets.bat,
    function (widget, args)
        if args[1] == "-" then
            return ("<span color='#CAA8FA'> ".. args[2] .. "</span>")
        else
            return ("<span color='#CAA8FA'> " .. args[2]  .."</span>")
        end
    end,
    1,
    "BAT0")

-- Widget Memory
mymemory = wibox.widget {
    memwidget,
    bottom = 2,
    widget = wibox.container.margin
}

mycpu = wibox.widget {
    cpuwidget,
    bottom = 2,
    widget = wibox.container.margin
}

myspeed = wibox.widget {
    netwidget,
    bottom = 2,
    widget = wibox.container.margin
}

mywifi = wibox.widget {
    wifiwidget,
    bottom = 2,
    widget = wibox.container.margin
}
mythermal = wibox.widget {
    thermalwidget,
    bottom = 2,
    widget = wibox.container.margin
}
mydate = wibox.widget {
    datewidget,
    bottom = 2,
    right = 0,
    widget = wibox.container.margin
}

mybattery = wibox.widget {
    batterywidget,
    bottom = 2,
    right = 0,
    widget = wibox.container.margin
}

-- Separator
myseparator = wibox.widget {
    {
        markup = '<span color="#F1FA8C">|</span>',
        font = 'FiraCode Nerd Font Light 6',
        widget = wibox.widget.textbox
    },
    bottom = 1,
    left = 3,
    right = 3,
    widget = wibox.container.margin
}
-- Create rocket icon
myicon = wibox.widget {
    layout  = wibox.layout.flex.vertical,
    {
        {
                {
                markup = '<span color="#ffffff"> </span>',
                font = "mononoki Nerd Font 9",
                widget = wibox.widget.textbox
                },
            left = 6,
            right = 3,
            widget  = wibox.container.margin,
        },
        id     = 'background_role',
        widget = wibox.container.background,
    },
}

-- Create a textclock widget

mytextclock = wibox.widget {
    wibox.widget.textclock(),
    bottom = 2,
    widget = wibox.container.margin
}

-- default
local cw = calendar_widget()
-- or customized
local cw = calendar_widget({
    theme = 'dracula',
    placement = 'top_right',
    radius = 5
})
mydate:connect_signal("mouse::enter",
    function()
        cw.toggle()
    end)
mydate:connect_signal("mouse::leave",
    function()
        cw.toggle()
    end)

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))


-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)

awful.screen.connect_for_each_screen(function(s)

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = wibox.widget {
        awful.widget.layoutbox(s),
        margins = 5,
        bottom = 6,
        widget = wibox.container.margin,
    }
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = tasklist_buttons,
        layout   = {
            layout  = wibox.layout.flex.horizontal
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        top = 3,
                        widget  = wibox.container.margin,
                    },
                    {
                        right = 5,
                        widget = wibox.container.margin,
                    },
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,

        },
    }

    -- Create a system tray
    s.systray = wibox.widget {
		visible = true,
		horizontal = false,
		screen = 'primary',
        align = "left",
		widget = wibox.widget.systray
	}
    s.systray:emit_signal("wdiget::redraw:needed")

    -- Create the wibox
    s.topwibar = awful.wibar({
        position = "top",
        type = "normal",
        screen = s,
        height = 24,
        bg = "#282936"
    })

    -- Add widgets to the wibox
    s.topwibar:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            myicon,
            -- mylauncher,
            -- s.mytaglist,
            -- s.mypromptbox,
			{
                s.mytasklist,
				top = 2,
				bottom = 3,
                right = 0,
                left = 2,
				widget = wibox.container.margin
			},
        },
        {
            -- Middle widget
            layout = wibox.layout.flex.horizontal,
        },
        {
			layout = wibox.layout.fixed.horizontal,
            mywifi,
            myspeed,
            myseparator,
            mycpu,
            myseparator,
            mymemory,
            myseparator,
            mythermal,
            myseparator,
            mydate,
            myseparator,
            mybattery,
            myseparator,
            {
                todo_widget(),
                margin = 2,
                widget = wibox.container.margin
            },
            myseparator,
            s.mylayoutbox,
            -- myseparator,
            -- {
			-- 	s.systray,
			-- 	top = 2,
            --     right = 5,
            --     left = 0,
            --     bottom = 2,
			-- 	widget = wibox.container.margin
			-- },
		}
    }

    -- Left wibar
    -- Each screen has its own tag table.
    -- awful.tag({ "", "", "", "", "", "", "", "", "" }, s, awful.layout.layouts[1])

    awful.tag.add("1", {
        icon             = "/home/dimmed/.config/awesome/icons/tag-list.floppy/web-browser.svg",
        layout              = awful.layout.suit.tile,
        screen              = s,
        gap_single_client  = false,
        gap                = 4,
        master_width_factor = 0.5,
        selected            = true,
    })
    awful.tag.add("2", {
        icon        = "/home/dimmed/.config/awesome/icons/tag-list.floppy/text-editor.svg",
        layout              = awful.layout.suit.tile,
        gap_single_client  = false,
        gap                = 4,
        master_width_factor = 0.5,
        screen              = s,
    })
    awful.tag.add("3", {
        icon        = "/home/dimmed/.config/awesome/icons/tag-list.floppy/terminal.svg",
        layout              = awful.layout.suit.tile,
        gap_single_client  = false,
        gap                = 4,
        master_width_factor = 0.5,
        screen              = s,
    })
    awful.tag.add("4", {
        icon        = "/home/dimmed/.config/awesome/icons/tag-list.floppy/multimedia.svg",
        layout              = awful.layout.suit.tile,
        gap_single_client  = false,
        gap                = 4,
        master_width_factor = 0.7,
        screen              = s,
    })
    awful.tag.add("5", {
        icon        = "/home/dimmed/.config/awesome/icons/tag-list.floppy/file-manager.svg",
        layout              = awful.layout.suit.tile,
        gap_single_client  = false,
        gap                = 4,
        master_width_factor = 0.5,
        screen              = s,
    })
    awful.tag.add("6", {
        icon        = "/home/dimmed/.config/awesome/icons/tag-list.floppy/social.svg",
        layout              = awful.layout.suit.max,
        gap_single_client  = false,
        gap                = 4,
        master_width_factor = 0.5,
        screen              = s,
    })
    awful.tag.add("7", {
        type = "terminal",
        icon        = "/home/dimmed/.config/awesome/icons/tag-list.floppy/menu2.svg",
        layout              = awful.layout.suit.max,
        gap_single_client  = false,
        gap                = 4,
        master_width_factor = 0.5,
        screen              = s,
    })
    awful.tag.add("8", {
        icon        = "/home/dimmed/.config/awesome/icons/tag-list.floppy/sandbox.svg",
        layout              = awful.layout.suit.max,
        gap_single_client  = false,
        gap                = 4,
        master_width_factor = 0.5,
        screen              = s,
    })
    awful.tag.add("9", {
        icon        = "/home/dimmed/.config/awesome/icons/tag-list.floppy/development.svg",
        layout              = awful.layout.suit.max,
        gap_single_client  = false,
        gap                = 4,
        master_width_factor = 0.5,
        screen              = s,
    })

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout   = {
            layout  = wibox.layout.fixed.vertical
        },
        widget_template = {
            {
                {
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                            resize = true,
                        },
                        margins = 0,
                        widget  = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 0,
                right = 1,
                top = 4,
                bottom = 6,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
            -- Add support for hover colors and an index label
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('icon_role')[1].markup = '<b> '..index..' </b>'
                self:connect_signal('mouse::enter', function()
                    if self.bg ~= '#ff0000' then
                        self.backup     = self.bg
                        self.has_backup = true
                    end
                    self.bg = '#ff0000'
                end)
                self:connect_signal('mouse::leave', function()
                    if self.has_backup then self.bg = self.backup end
                end)
            end,
            update_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('icon_role')[1].markup = '<b> '..index..' </b>'
            end,
        },
        buttons = taglist_buttons
}

    -- Create the wibox
    s.leftwibar = awful.wibar({
        position = "left",
        screen = s,
        type = "dock",
        width = 26,
        bg = "#282936"
    })

    -- Add widgets to the wibox
    s.leftwibar:setup {
        layout = wibox.layout.align.vertical,
        { -- Left widgets
            layout = wibox.layout.fixed.vertical,
            {
				s.mytaglist,
				bottom = 4,
                left = 3,
                right = 3,
				widget = wibox.container.margin
			},
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.vertical,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.vertical,
            {
				s.systray,
				top = 0,
                right = 5,
                left = 5,
                bottom = 10,
				widget = wibox.container.margin
			},
        },
    }
end)

-- ░█▄█░█▀█░█░█░█▀▀░█▀▀░░░█▀▄░▀█▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀░█▀▀
-- ░█░█░█░█░█░█░▀▀█░█▀▀░░░█▀▄░░█░░█░█░█░█░░█░░█░█░█░█░▀▀█
-- ░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀

root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- ░█░█░█▀▀░█░█░░░█▀▄░▀█▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀░█▀▀
-- ░█▀▄░█▀▀░░█░░░░█▀▄░░█░░█░█░█░█░░█░░█░█░█░█░▀▀█
-- ░▀░▀░▀▀▀░░▀░░░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀

globalkeys = gears.table.join(

    -- ----- Basic Function AwesomeWM ----
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "e", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "back to previous workspace", group = "navigation"}),

    -- ----- Window Navigation ------------
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "navigation"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "navigation"}
    ),

    -- Arrow Keys
    awful.key({ modkey,           }, "Up",
        function ()
            awful.client.focus.byidx( -1)
        end,
        {description = "focus next by index", group = "navigation"}
    ),
    awful.key({ modkey,           }, "Down",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus previous by index", group = "navigation"}
    ),

    -- ----- Window Manipulation ----------
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    -- Arrow Keys
    awful.key({ modkey,           }, "Right",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "Left",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "Left",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "Right",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "Left",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "Right",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    awful.key({ modkey,           }, "Next", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey            }, "Prior", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    awful.key({modkey, 'Control'}, 'Up', awful.tag.viewprev,
              {description = 'view previous tag', group = 'tag'}),
    awful.key({modkey, 'Control'}, 'Down', awful.tag.viewnext,
            {description = 'view next tag', group = 'tag'}),

    -- ----- Layout manipulation ----------
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({modkey, "Shift"}, 'equal', function() awful.tag.incgap(4) end,
              {description = 'increase gap', group = 'layout'}),
    awful.key({modkey, "Shift"}, '-', function() awful.tag.incgap(-4) end,
              {description = 'decrease gap', group = 'layout'}),

    -- Arrow Keys
    awful.key({ modkey, "Shift"   }, "Down", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "Up", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "Down", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "Up", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- ----- Launch Programs ----------
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
    {description = "open a terminal", group = "launcher"}),
    awful.key({modkey,            }, "d", function () awful.spawn.with_shell("~/.scripts/rofi/launcher.sh") end,
    {description = "open rofi laucher",group = "launcher"}),
    awful.key({                   },"Print", function () awful.spawn.with_shell("~/.scripts/scrot.sh") end,
    {description = "take a screenshot", group = "launcher"}),
    awful.key({ modkey,           }, "Print", function () awful.spawn.with_shell("scrot -s $HOME/Pictures/Snips/'snip_%m-%d-%Y_%H-%M-%S.png' --select -e 'xclip -selection clipboard -target image/png -i $f'") end,
    {description = "take a snip", group = "launcher"}),

    awful.key({}, "grave", function () quake:toggle() end,
    {description = "launch dropdown terminal", group = "launcher"}),

    -- ----- Multimedia Keys
    awful.key({                   },"XF86MonBrightnessUp", function () awful.spawn.with_shell("xbacklight -inc 5 && notify-send --urgency=low --hint=string:x-dunst-stack-tag:brightness \"Brightness : $(echo \"$(xbacklight -get)/1\" | bc)\"") end,
    {description = "increase brightness", group = "launcher"}),
    awful.key({                   },"XF86MonBrightnessDown", function () awful.spawn.with_shell("xbacklight -dec 5 && notify-send --urgency=low --hint=string:x-dunst-stack-tag:brightness \"Brightness : $(echo \"$(xbacklight -get)/1\" | bc)\"") end,
    {description = "increase brightness", group = "launcher"}),
    awful.key({                   },"XF86AudioRaise", function () awful.spawn.with_shell("pulsemixer --change-volume +10 --unmute") end,
    {description = "take a screenshot", group = "launcher"}),
    awful.key({                   },"XF86AudioLower", function () awful.spawn.with_shell("pulsemixer --change-volume -10 --unmute") end,
    {description = "take a screenshot", group = "launcher"}),

    -- ----- Standard program ----------
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)

-- ░█▀▄░█░█░█░░░█▀▀░█▀▀
-- ░█▀▄░█░█░█░░░█▀▀░▀▀█
-- ░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            honor_workarea = true,
            honor_padding = true
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
            "DTA",  -- Firefox addon DownThemAll.
            "copyq",  -- Includes session name in class.
            "pinentry",
        },
        class = {
            "Arandr",
            "Blueman-manager",
            "Gpick",
            "Kruler",
            "MessageWin",  -- kalarm.
            "Sxiv",
            "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
            "Wpa_gui",
            "veromix",
            "xtightvncviewer",
            "Grub-customizer",
            "Kvantum Manager",
            "Xfce-polkit",
            -- "Polkit-gnome-authentication-agent-1"
        },

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
            "Event Tester",  -- xev.
            "Open File",
        },
        role = {
            "AlarmWindow",  -- Thunderbird's calendar.
            "ConfigManager",  -- Thunderbird's about:config.
            "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
            "dialog",
            "modal",
        }
      },
      properties = {
            floating = true,
            ontop = true,
            honor_workarea = true,
            honor_padding  = true,
            placement = awful.placement.centered
        },
    },
    -- FLOATING
    { rule = { name = "Disk" },
      properties = { floating = true, ontop = true } },

    { rule = { name = "uGet" },
        properties = {
            floating = true,
            ontop = true,
            honor_workarea = true,
            honor_padding  = true,
            placement = awful.placement.bottom_left
        }
    },

    { rule = { class = "MEGAsync" },
        properties = {
            floating = true,
            ontop = true,
            honor_workarea = true,
            honor_padding  = true,
            placement = awful.placement.bottom_left
        }
    },

    -- TILED
    { rule = { name = "Untitled playlist (*)" },
      properties = {
          floating = false
        }
    },

    -- Tag Placement
    { rule = { class = "Ferdi" },
        properties = {
            tag = "6",
            switchtotag = true
        }
    },
}

-- ░█▀▀░▀█▀░█▀▀░█▀█░█▀█░█░░░█▀▀
-- ░▀▀█░░█░░█░█░█░█░█▀█░█░░░▀▀█
-- ░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)

    -- Focus, raise and activate
    c:emit_signal(
        'request::activate',
        'mouse_enter',
        {
            raise = true
        }
    )
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end
    if not awesome.startup then
        awful.client.setslave(c)
    end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- USER MODIFICATION

-- Focus urgent clients automatically
-- client.connect_signal("property::urgent", function(c)
-- 	c.minimized = false
-- 	c:jump_to()
-- end)

-- screen.connect_signal("arrange", function (s)
--     local max = s.selected_tag.layout.name == "max"
--     local only_one = #s.tiled_clients == 1 -- use tiled_clients so that other floating windows don't affect the count
--     -- but iterate over clients instead of tiled_clients as tiled_clients doesn't include maximized windows
--     for _, c in pairs(s.clients) do
--         if (max or only_one) then
--             c.border_width = 0
--             beautiful.useless_gap = 0
--         else
--             c.border_width = beautiful.border_width
--             beautiful.useless_gap = just_backup_gap
--         end
--     end
-- end)

bling.module.flash_focus.enable()




-- ░█▀█░█░█░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█▀▄░▀█▀
-- ░█▀█░█░█░░█░░█░█░▀▀█░░█░░█▀█░█▀▄░░█░
-- ░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░░▀░░▀░▀░▀░▀░░▀░

-- Autostart Programs
awful.spawn.with_shell("$HOME/.config/awesome/autorun.sh")
-- awful.spawn.with_shell("picom")
-- awful.spawn.with_shell("nitrogen --restore")
-- awful.spawn.with_shell("redshift-gtk")
-- awful.spawn.with_shell("nm-applet")
-- awful.spawn.with_shell("xsetroot -cursor_name left_ptr")
-- awful.spawn.with_shell("unclutter")
-- awful.spawn.with_shell("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
