-- disable netrw at the very start of your init.lua
-- (needed by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- configure Lazy
require("config.lazy")

--read in global options
require("config.options")

-- read in keymaps
require("config.keymaps")

--read in global configuraiton settings
require("config.globals")

-- Configure diagnostics.
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN },
    spacing = 8,
  },
})


-- Configure format on write
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('FormatAutogroup', { clear = true }),
  pattern = { '*.hcl', '*.tf' },
  callback = function() vim.cmd('FormatWrite') end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.hcl',
  callback = function()
    vim.bo.filetype = 'terraform'
    vim.bo.syntax = 'terraform'
  end,
})

