return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup(
      -- {
      --   filetypes = {
      --     '*', -- Highlight all files, but customize some others.
      --     css = { rgb_fn = true, },
      --     html = { names = false, },
      --     scss = { rgb_fn = true, },
      --     sass = { rgb_fn = true, },
      --     stylus = { rgb_fn = true, },
      --     markdown = { names = false, },
      --     vim = { names = false, },
      --     yaml = { names = false, },
      --   }
      -- }
      )
    end
  },
}