-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- configure Python VEnv
vim.g.python3_host_prog = '/home/patrick/.venv/bin/python'

-- configure Lazy
require("config.lazy")

-- configure nvim to use the system keyboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- general settings
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.spell = false
vim.opt.signcolumn = "auto"
vim.opt.wrap = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- search settings
vim.opt.ignorecase = true -- To ignore case when searching.
vim.opt.smartcase = true  -- When searching try to be smart about cases.
vim.opt.hlsearch = true   -- To highlight search results.
vim.opt.incsearch = true  -- To make search act like search in modern browsers.
vim.opt.magic = true      -- For regular expressions turn magic on.
