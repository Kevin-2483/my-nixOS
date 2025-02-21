local wezterm = require("wezterm")
local config = {
    font_size = 14,
    font = wezterm.font("SpaceMono Nerd Font"),
    color_scheme = "Catppuccin Mocha",
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    window_decorations = "RESIZE",
    show_new_tab_button_in_tab_bar = false,
    window_background_opacity = 0.9,
    macos_window_background_blur = 70,
    text_background_opacity = 0.9,
    adjust_window_size_when_changing_font_size = false,
    front_end = "WebGpu",
    window_padding = {
        left = 20,
        right = 20,
        top = 20,
        bottom = 5,
    },
    -- keys = {
    --     {
    --         кеу = "1",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey ({ key = "1" }) ,
    --         }),
    --     },
    --     {
    --         кеу = "2",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey({ key = "2" }),
    --         }),
    --     },
    --     {
    --         кеу = "3",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey({ key = "3" }),
    --         }),
    --     },
    --     {
    --         кеу = "4",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey({ key = "4" }),
    --         }),
    --     },
    --     {
    --         кеу = "5",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey({ key = "5" }),
    --         }),
    --     },
    --     {
    --         кеу = "6",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey({ key = "6" }),
    --         }),
    --     },
    --     {
    --         кеу = "7",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey({ key = "7" }),
    --         }),
    --     },
    --     {
    --         кеу = "8",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey({ key = "8" }),
    --         }),
    --     },
    --     {
    --         кеу = "9",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey({ key = "9" }),
    --         }),
    --     },
    --     {
    --         кеу = "0",
    --         mods = "CMD",
    --         action = wezterm.action.Multiple({
    --             wezterm.action.SendKey({ mods = "CTRL", key = " " }),
    --             wezterm.action.SendKey({ key = "0" }),
    --         }),
    --     },
    -- },

}

return config
