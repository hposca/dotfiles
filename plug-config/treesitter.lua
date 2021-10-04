require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "dockerfile",
    "go",
    "gomod",
    "hcl",
    "json",
    "lua",
    "python",
    "yaml",
  },
}
