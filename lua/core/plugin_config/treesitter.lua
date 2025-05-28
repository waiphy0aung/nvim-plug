require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "ruby", "vim", "javascript", "typescript", "tsx", "html", "css" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- Disable for performance
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true,
  },
}
