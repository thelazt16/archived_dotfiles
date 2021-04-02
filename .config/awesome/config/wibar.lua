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
        bat_level = tonumber(args[2])
        if args[1] == "+" then
            return ("<span color='#CAA8FA'> ".. args[2] .. "</span>")
        else
            if bat_level >= 90 then
                return ("<span color='#50fa7b'> ".. args[2] .. "</span>")
            elseif bat_level >= 70 then
                return ("<span color='#5af78e'> ".. args[2] .. "</span>")
            elseif bat_level >= 50 then
                return ("<span color='#f1fa8c'> ".. args[2] .. "</span>")
            elseif bat_level >= 30 then
                return ("<span color='#f4f99d'> ".. args[2] .. "</span>")
            elseif bat_level >= 20 then
                return ("<span color='#ff92d0'> ".. args[2] .. "</span>")
            elseif bat_level >= 10 then
                return ("<span color='#ff2222'> ".. args[2] .. "</span>")

            end
        end
    end,
    30,
    "BAT0")

-- Contains the widget to Wibox container margin for layouting
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
-- Create icon
myicon = wibox.widget {
    layout  = wibox.layout.flex.vertical,
    {
        {
                {
                image = '/home/dimmed/.config/awesome/icons/dracula.svg',
                widget = wibox.widget.imagebox,
                resize = true,
                },
            -- left = 6,
            -- right = 3,
            widget  = wibox.container.margin,
        },
        id     = 'background_role',
        widget = wibox.container.background,
    },
}

-- Awesome-WM-Widgets Calendar
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
                                                end)
                        )


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