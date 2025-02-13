return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = "#89b4fa",
        },
        indent = {
          enable = true,
          chars = {
            "│",
            "¦",
            "┆",
            "┊",
          },
          style = {
            "#FF0000",
            "#FF7F00",
            "#FFFF00",
            "#00FF00",
            "#00FFFF",
            "#0000FF",
            "#8B00FF",
          },
        },
        line_num = {
          enable = true,
          style = "#89b4fa",
        },
        blank = {
          enable = false,
          chars = {
            "․",
            "⁚",
            "⁖",
            "⁘",
            "⁙",
          },
          style = {
            { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), "" },
            "#806d9c",
            "#c06f98",
          },
        },
      })
    end
  },
}