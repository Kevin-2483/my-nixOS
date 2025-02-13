vim.g.mapleader = " "

local keymap = vim.keymap

-- 插入模式
keymap.set("i", ";;", "<ESC>")

-- 视觉模式
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 正常模式
keymap.set("n", "<leader>sv", "<C-w>v") --水平增加窗口
keymap.set("n", "<leader>sh", "<C-w>s") --竖直增加窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

keymap.set("n", "<leader>th", ":ToggleTerm<CR>")
keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
keymap.set("n", "<leader>tt", ":ToggleTerm direction=tab<CR>")
keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>")

function _G.set_terminal_keymaps()
  local keymap = vim.keymap
  local opts = {buffer = 0}
  keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  keymap.set('t', ';;', [[<C-\><C-n>]], opts)
  keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


