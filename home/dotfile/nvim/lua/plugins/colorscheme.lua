return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        blink_cmp = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
                notify = true,
        overseer = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("neopywal").setup({
        -- Uses a template file `~/.cache/wallust/colors_neopywal.vim` instead of the
        -- regular pywal template at `~/.cache/wal/colors-wal.vim`.
        use_wallust = true,

        -- This option allows to specify where Neopywal should look for a ".vim" template file
        -- (e.g.: os.getenv("HOME") .. "/.cache/wal/custom_neopywal_template.vim").
        -- colorscheme_file = "~/.cache/wallust/colors_neopywal.vim",

        -- This option allows to use a custom built-in theme palettes like "catppuccin-mocha" or "tokyonight".
        -- To get the list of available themes take a look at `https://github.com/RedsXDD/neopywal.nvim#Alternative-Palettes`.
        -- Take note that this option takes precedence over `use_wallust` and `colorscheme_file`.
        use_palette = "catppuccin-mocha",

        -- Sets the background color of certain highlight groups to be transparent.
        -- Use this when your terminal opacity is < 1.
        transparent_background = true,

        -- With this option you can overwrite all the base colors the colorscheme uses.
        -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim#Customizing-Colors`
        custom_colors = {},

        -- With this option you can overwrite any highlight groups set by the colorscheme.
        -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim#Customizing-Highlights`
        custom_highlights = {},

        -- Dims the background when another window is focused.
        dim_inactive = true,

        -- Apply colorscheme for Neovim's terminal (e.g. `g:terminal_color_0`).
        terminal_colors = true,

        -- Shows the '~' characters after the end of buffers.
        show_end_of_buffer = false,

        -- Shows the '|' split separator characters.
        -- It's worth noting that this options works better in conjunction with `dim_inactive`.
        show_split_lines = true,

        no_italic = false,        -- Force no italic.
        no_bold = false,          -- Force no bold.
        no_underline = false,     -- Force no underline.
        no_undercurl = false,     -- Force no undercurl.
        no_strikethrough = false, -- Force no strikethrough.

        -- Handles the styling of certain highlight groups (see `:h highlight-args`).
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          includes = { "italic" },
          strings = {},
          variables = { "italic" },
          numbers = {},
          booleans = {},
          types = { "italic" },
          operators = {},
        },

        -- Setting this to false disables all default file format highlights.
        -- Useful if you want to enable specific file format options.
        -- Defaults to false when treesitter is enabled,
        -- unless manually enabled inside the `setup()` function.
        default_fileformats = true,

        -- Setting this to false disables all default plugin highlights.
        -- Useful if you want to enable specific plugin options.
        default_plugins = true,

        -- For more fileformats options please scroll down (https://github.com/RedsXDD/neopywal.nvim#Fileformats)
        fileformats = {
          c_cpp = true,
          c_sharp = true,
        },

        -- For more plugin options please scroll down (https://github.com/RedsXDD/neopywal.nvim#Plugins)
        plugins = {
          alpha = true,
          coc = false,
          mini = {
            cursorword = true,
            files = true,
          },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neopywal",
    },
  },
}
