return {
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
        "<Leader>a",
        "<Cmd>MultipleCursorsAddMatches<CR>",
        mode = { "n", "x" },
        desc =
        "Add cursors to the word under the cursor"
      },
    },
  },
}