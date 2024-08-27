require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "bashls",
    "clangd",
    "csharp_ls",
    "cmake",
    "cssls",
    "html",
    "jsonls",
    "jdtls", --java
    "quick_lint_js",
    "texlab", --LaTeX
    "lua_ls",
    "markdown_oxide",
    "nil_ls", --nix
    "powershell_es",
    -- "pylyzer", --python
    "rust_analyzer",
    "sqlls",
    "taplo",
    "tsserver", --typescript
    "lemminx", -- xml
    "yamlls", --yaml
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}
