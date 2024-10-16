lvim.leader = "space"
lvim.colorscheme = "catppuccin-mocha"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = '>>'
vim.opt.relativenumber = true -- relative line numbers
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8 -- 设置光标发生滚动的距离值
vim.opt.sidescrolloff = 8 -- 设置光标和边距发生滚动的距离值
lvim.keys.insert_mode[";;"] = "<ESC>"
lvim.keys.insert_mode["<C-z>"] = "<C-o>u"
lvim.keys.normal_mode["<C-z>"] = "u"
lvim.keys.insert_mode["<C-y>"] = "<C-o><C-r>"
lvim.keys.insert_mode["<C-h>"] = "<C-o>:nohl<CR>"
lvim.keys.visual_mode["<C-b>"] = ":s/^/\\=line('.') - line(\"'<\") + 1/<CR>"
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"
lvim.keys.normal_mode["<leader>\\"] = ":ToggleTerm<CR>"
lvim.keys.normal_mode["<leader>tb"] = ":ToggleTerm direction=horizontal<CR>"
lvim.keys.normal_mode["<leader>tt"] = ":ToggleTerm direction=tab<CR>"
lvim.keys.normal_mode["<leader>tv"] = ":ToggleTerm direction=vertical<CR>"
lvim.keys.normal_mode["<Leader>n"] = "<Cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<Leader>b"] = "<Cmd>BufferLineCyclePrev<CR>"
lvim.plugins = {
  -- -- Using lazy.nvim
  -- {
  --   "nosduco/remote-sshfs.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  --   config = function()
  --     require('remote-sshfs').setup{
  --       connections = {
  --         ssh_configs = { -- which ssh configs to parse for hosts list
  --           vim.fn.expand "$HOME" .. "/.ssh/config",
  --           "/etc/ssh/ssh_config",
  --           -- "/path/to/custom/ssh_config"
  --         },
  --         -- NOTE: Can define ssh_configs similarly to include all configs in a folder
  --         -- ssh_configs = vim.split(vim.fn.globpath(vim.fn.expand "$HOME" .. "/.ssh/configs", "*"), "\n")
  --         sshfs_args = { -- arguments to pass to the sshfs command
  --           "-o reconnect",
  --           "-o ConnectTimeout=5",
  --         },
  --       },
  --       mounts = {
  --         base_dir = vim.fn.expand "$HOME" .. "/.sshfs/", -- base directory for mount points
  --         unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
  --       },
  --       handlers = {
  --         on_connect = {
  --           change_dir = true, -- when connected change vim working directory to mount point
  --         },
  --         on_disconnect = {
  --           clean_mount_folders = false, -- remove mount point folder on disconnect/unmount
  --         },
  --         on_edit = {}, -- not yet implemented
  --       },
  --       ui = {
  --         select_prompts = false, -- not yet implemented
  --         confirm = {
  --           connect = true, -- prompt y/n when host is selected to connect to
  --           change_dir = false, -- prompt y/n to change working directory on connection (only applicable if handlers.on_connect.change_dir is enabled)
  --         },
  --       },
  --       log = {
  --         enable = false, -- enable logging
  --         truncate = false, -- truncate logs
  --         types = { -- enabled log types
  --           all = false,
  --           util = false,
  --           handler = false,
  --           sshfs = false,
  --         },
  --       },
  --     }
  --     local api = require('remote-sshfs.api')
  --     vim.keymap.set('n', '<leader>rc', api.connect, {})
  --     vim.keymap.set('n', '<leader>rd', api.disconnect, {})
  --     vim.keymap.set('n', '<leader>re', api.edit, {})
  --     -- (optional) Override telescope find_files and live_grep to make dynamic based on if connected to host
  --     local builtin = require("telescope.builtin")
  --     local connections = require("remote-sshfs.connections")
  --     vim.keymap.set("n", "<leader>ff", function()
  --       if connections.is_connected then
  --         api.find_files()
  --       else
  --         builtin.find_files()
  --       end
  --     end, {})
  --     vim.keymap.set("n", "<leader>fg", function()
  --       if connections.is_connected then
  --         api.live_grep()
  --       else
  --         builtin.live_grep()
  --       end
  --     end, {})
  --   end
  -- },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },  -- 文件打开或新建时加载
    config = function()
        local rainbow_delimiters = require 'rainbow-delimiters'

        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
                vim = rainbow_delimiters.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            priority = {
                [''] = 110,
                lua = 210,
            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory" ,
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<c-up>',
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = { 'nvimtools/hydra.nvim', },
    opts = {
      {
        DEBUG_MODE = false,
        create_commands = true, -- create Multicursor user commands
        updatetime = 50, -- selections get updated if this many milliseconds nothing is typed in the insert mode see :help updatetime
        nowait = true, -- see :help :map-nowait
        mode_keys = {
            append = 'a',
            change = 'c',
            extend = 'e',
            insert = 'i',
        }, -- set bindings to start these modes
           -- see :help hydra-config.hint
        hint_config = {
            float_opts = {
                border = 'none',
            },
            position = 'bottom',
        },
        -- accepted values:
        -- -1 true: generate hints
        -- -2 false: don't generate hints
        -- -3 [[multi line string]] provide your own hints
        -- -4 fun(heads: Head[]): string - provide your own hints
        generate_hints = {
            normal = false,
            insert = false,
            extend = false,
            config = {
                 -- determines how many columns are used to display the hints. If you leave this option nil, the number of columns will depend on the size of your window.
                column_count = nil,
                -- maximum width of a column.
                max_hint_length = 25,
            }
        },
      }
    },
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
      {
        mode = { 'v', 'n' },
        '<Leader>m',
        '<cmd>MCstart<cr>',
        desc = 'Create a selection for selected text or word under the cursor',
      },
      {
        mode = { 'i' },
        ';;',
        '<ESC>',
        desc = 'ESC',
      },
    },
  },
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {
      pre_hook = function()
        vim.cmd("set nocul")
        vim.cmd("NoMatchParen")
      end,
      post_hook = function()
        vim.cmd("set cul")
        vim.cmd("DoMatchParen")
      end,
    },
    keys = {
      {
        "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add a cursor then move down"
      },
      {
        "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add a cursor then move down"
      },
      {
        "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add a cursor then move up"
      },
      {
        "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add a cursor then move up"
      },
      {
        "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove a cursor"
      },
      {
        "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to the word under the cursor"
      },
    },
  },
  -- {
  --   "Pocco81/auto-save.nvim",
  --   config = function()
  --     require("auto-save").setup()
  --   end,
  -- },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" }
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({       -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 0")
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
  },
}


-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
