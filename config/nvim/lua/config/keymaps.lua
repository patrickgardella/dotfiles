local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- nvim-tree navigation
keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', opts)
keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>', opts)

-- Pane navigation
keymap.set('n', '<C-Left>', '<C-w>h', opts) -- Navigate Left
keymap.set('n', '<C-Down>', '<C-w>j', opts) -- Navigate Down
keymap.set('n', '<C-Up>', '<C-w>k', opts) -- Navigate Up
keymap.set('n', '<C-Right>', '<C-w>l', opts) -- Navigate Right

-- Window management
keymap.set('n', '<leader>sv', ':vsplit<CR>', opts)          -- Vertical split
keymap.set('n', '<leader>sh', ':split<CR>', opts)           -- Horizontal split
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', opts) -- Maximize current window

-- Feature toggles
keymap.set('n', '<leader>ww', ':set wrap!<CR>', opts) -- Toggle word wrap
