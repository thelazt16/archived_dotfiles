---@diagnostic disable: lowercase-global
-- ░█░░░▀█▀░█▀▄░█▀▄░█▀█░█▀▄░█░█
-- ░█░░░░█░░█▀▄░█▀▄░█▀█░█▀▄░░█░
-- ░▀▀▀░▀▀▀░▀▀░░▀░▀░▀░▀░▀░▀░░▀░

-- Load modules from luarocks
-- pcall(require, "luarocks.loader")

-- Standard awesome library
gears               = require("gears")
awful               = require("awful")
                      require("awful.autofocus")
wibox               = require("wibox")
beautiful           = require("beautiful")
naughty             = require("naughty")
menubar             = require("menubar")
hotkeys_popup       = require("awful.hotkeys_popup")

-- Other library
lain                = require("lain")
vicious             = require("vicious")

-- Enable hotkeys help widget
                      require("awful.hotkeys_popup.keys")
config              = require("config")

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
