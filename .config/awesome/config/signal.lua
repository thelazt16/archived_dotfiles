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

-- bling.module.flash_focus.enable()