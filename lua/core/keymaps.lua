local keymap = vim.keymap

-- Clear search highlight
keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = "Clear search highlight" })

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Tabs
keymap.set('n', 'te', ':tabedit<Return>')
keymap.set('n', '<Tab>', ':tabnext<Return>')
keymap.set('n', '<S-Tab>', ':tabprev<Return>')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { desc = "Split horizontal" })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { desc = "Split vertical" })

-- Window navigation
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-l>', '<C-w>l')

-- Git blame toggle
keymap.set('n', 'tb', ':Gitsigns toggle_current_line_blame<Return>', { desc = "Toggle git blame" })
