THEME = {
  git = {
    -- 将颜色字符串改为 { fg = "颜色值" } 的格式
    modified       = { fg = "#ffa500" },
    added          = { fg = "#32cd32" },
    deleted        = { fg = "#ff4500" },
    untracked      = { fg = "#a9a9a9" },
    ignored        = { fg = "#696969" },
    updated        = { fg = "#1e90ff" },

    -- 图标部分保持不变
    modified_sign  = "",
    added_sign     = "",
    deleted_sign   = "",
    untracked_sign = "",
    ignored_sign   = "",
    updated_sign   = "U",
  }
  -- ... 其他主题相关的配置
}

require("full-border"):setup({
    -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
    type = ui.Border.ROUNDED,
})
require("git"):setup()
require("starship"):setup()
require("mactag"):setup {
  -- Keys used to add or remove tags
  keys = {
    r = "Red",
    o = "Orange",
    y = "Yellow",
    g = "Green",
    b = "Blue",
    p = "Purple",
  },
  -- Colors used to display tags
  colors = {
    Red    = "#ee7b70",
    Orange = "#f5bd5c",
    Yellow = "#fbe764",
    Green  = "#91fc87",
    Blue   = "#5fa3f8",
    Purple = "#cb88f8",
  },
}

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

function Status:name()
  local h = self._current.hovered
  if not h then
    return ""
  end

  local linked = ""
  if h.link_to ~= nil then
  	linked = " -> " .. tostring(h.link_to)
  end
  return ui.Line(" " .. h.name .. linked)
end