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
" Plug 'dense-analysis/ale'
Plug 'mhinz/vim-startify'
" Initialize plugin system
call plug#end()

" Set the leader key to comma
let mapleader = ','

set termguicolors
set clipboard=unnamedplus
set clipboard+=unnamed

nnoremap <C-a> ggVG

nnoremap <silent>sv :vsp<CR><C-w>l
nnoremap <silent>ss :sp<CR><C-w>j

" Telescope mappings
nnoremap <silent>fe :Telescope file_browser<CR>
nnoremap <silent>ff :lua require('telescope.builtin').find_files({ file_ignore_patterns = {'node_modules','build'}, hidden=true })<CR>
nnoremap <silent>fg :Telescope live_grep<CR>
nnoremap <silent>fb :Telescope buffers<CR>
nnoremap <silent>fh :Telescope help_tags<CR>

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

set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gD :call CocAction('jumpDefinition', 'tabnew')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType javascript,javascriptreact,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

nmap <leader>cl  <Plug>(coc-codelens-action)

set signcolumn=no

lua << EOF
require("nvim-autopairs").setup {
	map_cr = false
	}
EOF

lua require("toggleterm").setup()

lua require("gitsigns").setup()

nnoremap tb :Gitsigns toggle_current_line_blame<CR>

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

