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
            placement = awful.placement.no_overlap+awful.placement.no_offscreen+awful.placement.centered,
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
            "Cpupower-gui"
            -- "Polkit-gnome-authentication-agent-1"
        },

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
            "Event Tester",  -- xev.
            "Open File",
            "Open Folder",
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
          floating = false,
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