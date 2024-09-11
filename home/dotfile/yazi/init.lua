require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})
require("git"):setup()
require("mactag"):setup {
	-- You can change the colors of the tags here
	colors = {
		Red    = "#ee7b70",
		Orange = "#f5bd5c",
		Yellow = "#fbe764",
		Green  = "#91fc87",
		Blue   = "#5fa3f8",
		Purple = "#cb88f8",
		Gray   = "#b5b5b9",
	},
}

function Linemode:size_and_mtime()
	local year = os.date("%Y")
	local time = (self._file.cha.modified or 0) // 1

	if time > 0 and os.date("%Y", time) == year then
		time = os.date("%b %d %H:%M", time)
	else
		time = time and os.date("%b %d  %Y", time) or ""
	end

	local size = self._file:size()
	return ui.Line(string.format(" %s %s ", size and ya.readable_size(size) or "-", time))
end
