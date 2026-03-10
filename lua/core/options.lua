-- Disable unused providers (must be set before plugins load)
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Leader keys (must be set before lazy.nvim)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.synmaxcol = 300
vim.opt.lazyredraw = true
vim.opt.regexpengine = 1

-- Editor
vim.opt.backspace = '2'
vim.opt.showcmd = true
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
