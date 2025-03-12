require'nvim-treesitter.configs'.setup {
  -- A list of parser name or "all"
  ensure_instaled = { "c", "lua", "rust", "ruby", "vim", "js" },
  
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  hightlight = {
    enable = true
  },
}
