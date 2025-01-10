" Plugin Initialization
call plug#begin('~/.vim/plugged')

" Core Utilities
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'

" Appearance
Plug 'shaunsingh/nord.nvim'
Plug 'maxmx03/solarized.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'slugbyte/lackluster.nvim'
Plug 'gmr458/cold.nvim'

" Productivity
Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/gitsigns.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'akinsho/toggleterm.nvim', {'tag': '*'}

" Startup
Plug 'mhinz/vim-startify'

call plug#end()

" General Settings
let mapleader = ','
set lazyredraw
set number
set termguicolors
set clipboard=unnamedplus
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set cindent
set shortmess+=c
set signcolumn=no

" Colorscheme
colorscheme cold

" Highlighting
hi Normal guibg=none
hi LineNr guibg=none
hi StatusLine guibg=none
hi StatusLineNC guibg=none

" Key Mappings
nnoremap <C-a> ggVG
nnoremap <silent>sv :vsp<CR><C-w>l
nnoremap <silent>ss :sp<CR><C-w>j
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader>te :tabnew<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>

" Terminal
nnoremap <C-t> :ToggleTerm<CR>
inoremap <C-t> <Esc>:ToggleTerm<CR>
tnoremap <C-t> <C-\><C-n>:ToggleTerm<CR>

" Multiple Cursors
nmap <Leader>m <Plug>(MultipleCursorsToggle)
vmap <Leader>m <Plug>(MultipleCursorsVisual)
nmap <Leader>n <Plug>(MultipleCursorsPrev)
nmap <Leader>N <Plug>(MultipleCursorsSkipPrev)
nmap <Leader>m <Plug>(MultipleCursorsNext)
nmap <Leader>M <Plug>(MultipleCursorsSkipNext)

" Telescope
lua << EOF
local telescope = require("telescope")
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local fb_actions = require("telescope").extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = { n = { ["q"] = actions.close } },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = { ["<C-w>"] = function() vim.cmd('normal vbd') end },
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function() vim.cmd('startinsert') end,
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

vim.keymap.set("n", "fe", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    hidden = true,
    grouped = true,
    previewer = true,
    initial_mode = "normal",
  })
end)

vim.keymap.set("n", "ff", function()
  builtin.find_files({
    file_ignore_patterns = { "node%_modules/.*" },
    hidden = true,
  })
end)
vim.keymap.set("n", "fg", builtin.live_grep)
vim.keymap.set("n", "fb", builtin.buffers)
vim.keymap.set("n", "fh", builtin.help_tags)
EOF

" Autopairs
lua << EOF
require("nvim-autopairs").setup {
  disable_filetype = { "TelescopePrompt" },
  check_ts = true,
  map_cr = false,
}
EOF

" Gitsigns
lua << EOF
require("gitsigns").setup()
EOF

" ToggleTerm
lua << EOF
require("toggleterm").setup({
  size = 40,
})
EOF

" Coc Configuration
let g:coc_global_extensions = [
  \ 'coc-snippets', 'coc-pairs', 'coc-tsserver', 'coc-eslint', 
  \ 'coc-prettier', 'coc-json'
\ ]

" Format Command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" File Type Specific Comment Strings
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascriptreact setlocal commentstring={/*%s*/}
autocmd FileType jsx setlocal commentstring={/*%s*/}
autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" Coc Keybindings
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Diagnostic Navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Code Actions
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)

" Refactoring
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Formatting
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Jump to Definitions
nmap <silent> gD :call CocAction('jumpDefinition', 'tabnew')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
