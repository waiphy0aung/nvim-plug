hi Normal guibg=black ctermbg=black

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/gitsigns.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-startify'
" Initialize plugin system
call plug#end()

" Set the leader key to comma
let mapleader = ','

" Telescope mappings
nnoremap <leader>fe :Telescope file_browser<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files({ file_ignore_patterns = {'node_modules','build'} })<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>

" For init.vim
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascriptreact setlocal commentstring={/*%s*/}
autocmd FileType jsx setlocal commentstring={/*%s*/}

" Command for Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Better display for messages
" set cmdheight=2

" You will have a bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
lua << EOF
require("nvim-autopairs").setup {}
EOF

lua require("toggleterm").setup()

let g:gitsigns_current_line_blame = 1

nmap <Leader>m <Plug>(MultipleCursorsToggle)
vmap <Leader>m <Plug>(MultipleCursorsVisual)
nmap <Leader>n <Plug>(MultipleCursorsPrev)
nmap <Leader>N <Plug>(MultipleCursorsSkipPrev)
nmap <Leader>m <Plug>(MultipleCursorsNext)
nmap <Leader>M <Plug>(MultipleCursorsSkipNext)

nnoremap <C-t> :ToggleTerm<CR>

inoremap <C-t> <Esc>:ToggleTerm<CR>

tnoremap <C-t> <C-\><C-n>:ToggleTerm<CR>

nnoremap <Leader>te :tabnew<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>
nnoremap fm :ALEFix<CR>

let g:ale_linters_explicit = 1
let g:ale_fixers_explicit = 1
let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'json': ['prettier'],
  \ }

let g:ale_echo_msg_error_str = ' '
let g:ale_echo_msg_format = '[ALE] %s'
