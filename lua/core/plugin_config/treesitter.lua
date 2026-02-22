local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  vim.notify('nvim-treesitter not installed; skipping treesitter config', vim.log.levels.WARN)
  return
end

configs.setup {
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
