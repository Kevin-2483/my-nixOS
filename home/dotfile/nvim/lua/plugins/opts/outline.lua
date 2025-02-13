return {
  {
    "folke/trouble.nvim",
    optional = true,
    keys = {
      { "<leader>cs", false },
    },
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      local edgy_idx = LazyVim.plugin.extra_idx("ui.edgy")
      local symbols_idx = LazyVim.plugin.extra_idx("editor.outline")

      if edgy_idx and edgy_idx > symbols_idx then
        LazyVim.warn(
          "The `edgy.nvim` extra must be **imported** before the `outline.nvim` extra to work properly.",
          { title = "LazyVim" }
        )
      end

      opts.right = opts.right or {}
      table.insert(opts.right, {
        title = "Outline",
        ft = "Outline",
        pinned = true,
        open = "Outline",
      })
    end,
  }
}
