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
keymap.set('n', '<leader>sv', ':vsplit<CR>', opts) -- Vertical split
keymap.set('n', '<leader>sh', ':split<CR>', opts)  -- Horizontal split

-- Feature toggles
keymap.set('n', '<leader>ww', ':set wrap!<CR>', opts) -- Toggle word wrap

-- Diagnostic navigation (always available, not LSP-specific)
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

-- LSP keymaps (buffer-local, set on attach)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp.keymaps', { clear = true }),
  callback = function(args)
    local map = function(keys, func, desc)
      keymap.set('n', keys, func, { noremap = true, silent = true, buffer = args.buf, desc = desc })
    end

    map('gd',         vim.lsp.buf.definition,     'Go to definition')
    map('gD',         vim.lsp.buf.declaration,    'Go to declaration')
    map('gr',         vim.lsp.buf.references,     'List references')
    map('gi',         vim.lsp.buf.implementation, 'Go to implementation')
    map('K',          vim.lsp.buf.hover,          'Hover documentation')
    map('<leader>rn', vim.lsp.buf.rename,         'Rename symbol')
    map('<leader>ca', vim.lsp.buf.code_action,    'Code action')
  end,
})
