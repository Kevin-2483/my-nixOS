-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Insert mode
map("i", ";;", "<ESC>", { desc = "Escape insert mode" })
map("i", "<C-z>", "<C-o>u", { desc = "Undo in insert mode" })
map("i", "<C-y>", "<C-o><C-r>", { desc = "Redo in insert mode" })
map("i", "<C-h>", "<C-o>:nohl<CR>", { desc = "Remove search highlight" })

-- Normal mode
map("n", "<C-z>", "u", { desc = "Undo in normal mode" })
map("n", "d", '"_d', { desc = "Delete without yanking" })
map("n", "p", '"_dP', { desc = "Paste without overwriting register" })
map("n", "<leader>d", '"d', { desc = "Delete into 'd' register" })
map("n", "<leader>p", '"dP', { desc = "Paste from 'd' register" })
map("n", "<leader>\\", ":ToggleTerm<CR>", { desc = "Toggle terminal" })
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Toggle horizontal terminal" })
map("n", "<leader>tt", ":ToggleTerm direction=tab<CR>", { desc = "Toggle terminal in a tab" })
map("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Toggle vertical terminal" })
map("n", "<leader>n", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
map("n", "<leader>b", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })

-- Visual mode
map("v", "<leader>b", ":s/^/\\=line('.') - line(\"'<\") + 1/<CR>", { desc = "Number selected lines" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
map("v", "p", '"_dP', { desc = "Paste without overwriting register" })
map("v", "d", '"_d', { desc = "Delete without yanking" })
map("v", "<leader>d", '"d', { desc = "Delete into 'd' register" })
map("v", "<leader>p", '"dP', { desc = "Paste from 'd' register" })

-- Terminal mode
map("t", "<C-\\>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
