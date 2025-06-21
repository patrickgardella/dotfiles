local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- nvim-tree navigation
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
keymap.set('n', '<leader>f', ':NvimTreeFocus<CR>', opts)

-- Pane navigation
keymap.set('n', '<C-h>', '<C-w>h', opts) -- Navigate Left
keymap.set('n', '<C-j>', '<C-w>j', opts) -- Navigate Down
keymap.set('n', '<C-k>', '<C-w>k', opts) -- Navigate Up
keymap.set('n', '<C-l>', '<C-w>l', opts) -- Navigate Right

-- Window management
keymap.set('n', '<leader>sv', ':vsplit<CR>', opts)          -- Vertical split
keymap.set('n', '<leader>sh', ':split<CR>', opts)           -- Horizontal split
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', opts) -- Maximize current window
