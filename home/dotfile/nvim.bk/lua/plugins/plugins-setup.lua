-- 安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存文件自动安装更新软件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
  ]])
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer 插件管理器
  use { "catppuccin/nvim", as = "catppuccin" } --猫布奇主题
  use {
    'nvim-lualine/lualine.nvim', -- 状态栏
    requires = { 'nvim-tree/nvim-web-devicons', opt = true } -- 状态栏图示
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use("christoomey/vim-tmux-navigator") -- Ctrl-hjkl
  use "nvim-treesitter/nvim-treesitter" --语法高亮
  use "HiPhish/rainbow-delimiters.nvim" -- 彩虹括号
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径

  use "numToStr/Comment.nvim" -- gcc和gc注释
  use "windwp/nvim-autopairs" -- 自动补全括号

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" -- 左则git提示

  use {
    'nvim-telescope/telescope.nvim', tag = "*", -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
  end} -- terminal

  if packer_bootstrap then
    require('packer').sync()
  end
end)
