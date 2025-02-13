-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = ">>"
vim.opt.relativenumber = true -- relative line numbers
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8 -- 设置光标发生滚动的距离值
vim.opt.sidescrolloff = 8 -- 设置光标和边距发生滚动的距离值
vim.opt.hidden = true -- 允许在有未保存的修改时切换缓冲区，不会丢失未保存的修改
