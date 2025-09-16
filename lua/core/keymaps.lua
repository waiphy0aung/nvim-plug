vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Performance settings
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.synmaxcol = 300 -- Limit syntax highlighting for long lines

-- Editor settings
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.number = true
-- vim.opt.relativenumber = true -- More efficient for navigation
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.wildignore:append { '*/node_modules/*', '*/.git/*', '*/dist/*', '*/build/*' }
vim.opt.clipboard:append { 'unnamedplus' }

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Performance
vim.opt.lazyredraw = true
vim.opt.regexpengine = 1

-- Set colorscheme in autocmd to avoid loading issues
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd.colorscheme("nord")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
  end,
})

local keymap = vim.keymap

keymap.set('n', '<leader>h', ':nohlsearch<CR>')
-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
-- New tab
keymap.set('n', 'te', ':tabedit<Return>')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Window navigation: use <C-h/j/k/l> and tabs instead of mapping <Space>
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')

keymap.set('n', '<Tab>', ':tabnext<Return>')
keymap.set('n', '<S-Tab>', ':tabprev<Return>')

keymap.set('n', 'tb', ':Gitsigns toggle_current_line_blame<Return>')

keymap.set('n', '<C-t>', '<Cmd>execute v:count . "ToggleTerm"<CR>', { silent = true })
keymap.set('t', '<C-t>', "<Esc><Cmd>ToggleTerm<CR>", { silent = true })
keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

keymap.set("n", "fm", ":lua vim.lsp.buf.format()<Return>")
keymap.set("v", "fm", vim.lsp.buf.format, { remap = false })
