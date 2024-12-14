require("full-border"):setup({
    -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
    type = ui.Border.ROUNDED,
})
require("git"):setup()
require("starship"):setup()
-- require("mactag"):setup {
--     -- You can change the colors of the tags here
--     colors = {
--         Red    = "#ee7b70",
--         Orange = "#f5bd5c",
--         Yellow = "#fbe764",
--         Green  = "#91fc87",
--         Blue   = "#5fa3f8",
--         Purple = "#cb88f8",
--         Gray   = "#b5b5b9",
--     },
-- }

function Linemode:size_and_mtime()
    local year = os.date("%Y")
    local time = (self._file.cha.mtime or 0) // 1

    if time > 0 and os.date("%Y", time) == year then
        time = os.date("%b %d %H:%M", time)
    else
        time = time and os.date("%b %d  %Y", time) or ""
    end

    local size = self._file:size()
    return ui.Line(string.format(" %s %s ", size and ya.readable_size(size) or "-", time))
end

Status:children_add(function()
    local h = cx.active.current.hovered
    if h == nil or ya.target_family() ~= "unix" then
        return ui.Line {}
    end

    return ui.Line {
        ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
        ui.Span(":"),
        ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
        ui.Span(" "),
    }
end, 500, Status.RIGHT)

-- You can configure your bookmarks by lua language
local bookmarks = {}

local path_sep = package.config:sub(1, 1)
local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
if ya.target_family() == "windows" then
    table.insert(bookmarks, {
        tag = "Scoop Local",

        path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
        key = "p"
    })
    table.insert(bookmarks, {
        tag = "Scoop Global",
        path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
        key = "P"
    })
end
table.insert(bookmarks, {
    tag = "Desktop",
    path = home_path .. path_sep .. "Desktop" .. path_sep,
    key = "d"
})

require("yamb"):setup {
    -- Optional, the path ending with path seperator represents folder.
    bookmarks = bookmarks,
    -- Optional, recieve notification everytime you jump.
    jump_notify = true,
    -- Optional, the cli of fzf.
    cli = "fzf",
    -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
    keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
    -- Optional, the path of bookmarks
    path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or
        (os.getenv("HOME") .. "/.config/yazi/bookmark"),
}
