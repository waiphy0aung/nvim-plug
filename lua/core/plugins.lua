local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- themes
  use 'ellisonleao/gruvbox.nvim'
  use 'shaunsingh/nord.nvim'
  -- use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'akinsho/toggleterm.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'terryma/vim-multiple-cursors'
  use "mhinz/vim-startify"
  use 'lewis6991/gitsigns.nvim'
  use('MunifTanjim/prettier.nvim')
  -- use 'tpope/vim-commentary'
  -- use 'mxw/vim-jsx'
  -- use 'suy/vim-context-commentstring'
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  })

  use({
    'onsails/lspkind-nvim',
    'hrsh7th/cmp-buffer',              -- nvim-cmp source for buffer words
    'hrsh7th/cmp-nvim-lsp',            -- nvim-cmp source for neovim's built-in LSP
    'hrsh7th/nvim-cmp'
  })
  use 'L3MON4D3/LuaSnip'
  

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
