require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "c", "cpp", "c_sharp", 
                        "cmake", "css", "git_config", 
                        "git_rebase", "gitattributes", 
                        "gitcommit", "gitignore", 
                        "html", "http", "ini", "java", 
                        "javascript", "json", "lua", 
                        "markdown_inline", "nix", "python", 
                        "regex", "rust", "scss", "sql", 
                        "ssh_config", "toml", "typescript", 
                        "tsx", "vim", "vue", "xml", "yaml"
                      },
  highlight = { enable = true },
  indent = { enable = true },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
