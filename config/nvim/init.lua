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

-- Configure diagnostics.
vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
		spacing = 8,
	},
})


-- Configure format on write
vim.api.nvim_exec(
	[[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.hcl,*.tf FormatWrite
      autocmd BufNewFile,BufRead *.hcl set filetype=terraform syntax=terraform
    augroup END
  ]],
	true
)

-- Enable auto-completion and auto-formatting + linting
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/implementation') then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end
		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			-- client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		--		if not client:supports_method('textDocument/willSaveWaitUntil')
		--			and client:supports_method('textDocument/formatting') then
		--			vim.api.nvim_create_autocmd('BufWritePre', {
		--				group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
		--				buffer = args.buf,
		--				callback = function()
		--					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
		--				end,
		--			})
		--		end
	end,
})
