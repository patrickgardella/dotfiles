-- line numbering
vim.opt.relativenumber = true -- To show relative line numbers.
vim.opt.number = true         -- To show absolute line numbers

-- external tools
vim.opt.spell = false -- To enable spell checking

-- tabs and indentation
vim.opt.wrap = false       -- To disable line wrapping
vim.opt.shiftwidth = 2     -- To set the number of spaces for each indentation level
vim.opt.tabstop = 2        -- To set the number of spaces a tab counts for
vim.opt.softtabstop = 2    -- To set the number of spaces a tab counts for when editing
vim.opt.expandtab = true   -- To convert tabs to spaces
vim.opt.smartindent = true -- To enable smart indentation

-- search settings
vim.opt.ignorecase = true -- To ignore case when searching.
vim.opt.smartcase = true  -- When searching try to be smart about cases.
vim.opt.hlsearch = true   -- To highlight search results.
vim.opt.incsearch = true  -- To make search act like search in modern browsers.
vim.opt.magic = true      -- For regular expressions turn magic on.

--UI settings
vim.opt.termguicolors = true                                -- To enable 24-bit RGB color in the terminal
vim.opt.colorcolumn = "80"                                  -- To highlight the 80th column
vim.opt.signcolumn = "yes"                                  -- Add a column for signs (like git changes) or breakpoints
vim.opt.completeopt = { "menuone", "noselect", "noinsert" } -- To configure completion option - don't select anything by default and don't insert anything by default. If menu is not shown, then don't show anything.

-- Behaviour
vim.opt.splitright = true                         -- To open vertical splits to the right
vim.opt.splitbelow = true                         -- To open horizontal splits below the current window
vim.opt.swapfile = true                           -- To disable swap files
vim.opt.backup = true                             -- To enable backup files
vim.opt.undofile = true                           -- To enable persistent undo files
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- To set the directory for undo files
vim.opt.backspace = "indent,eol,start"            -- To allow backspacing over everything in insert mode
vim.opt.mouse:append("a")                         -- To enable mouse support in all modes
vim.opt.clipboard:append("unnamedplus")           -- To use the system clipboard for copy/paste operations
vim.opt.encoding = "utf-8"                        -- To set the default encoding to UTF-8
