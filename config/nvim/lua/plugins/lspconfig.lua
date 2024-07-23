return {
	-- https://github.com/williamboman/mason-lspconfig.nvim
	-- TODO: Setup nvim-lint, formatter.nvim or conform.nvim
	-- https://github.com/mfussenegger/nvim-lint
	-- https://github.com/mhartington/formatter.nvim
	-- https://github.com/stevearc/conform.nvim
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		lazy = false,
		config = function()
			require("mason").setup()
		end
	},

	{
		-- https://github.com/mfussenegger/nvim-dap
		"mfussenegger/nvim-dap",

		-- Config Help:
		-- https://davelage.com/posts/nvim-dap-getting-started/
		-- https://blog.cryptomilk.org/2024/01/02/neovim-dap-and-gdb-14-1/ & https://git.cryptomilk.org/users/asn/dotfiles.git/tree/dot_config/nvim

		-- https://github.com/jay-babu/mason-nvim-dap.nvim
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { 'chrome', 'bash', 'bash-debug-adapter' },
				handlers = {}, -- sets up dap in the predefined manner
			})
		end
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			'williamboman/mason.nvim',
		},

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					'arduino_language_server',
					'bashls',
					-- We need to install clangd for arduino_language_server to work
					'clangd',
					'lua_ls',
					'markdown_oxide',
					--'r_language_server',
					'rust_analyzer',
					'yamlls',
				},
			})
		end
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Configure the R lintr
			vim.g.LanguageClient_serverCommands = {
				r = { "R", "--slave", "-e", "languageserver::run()" } }


			local lspconfig = require('lspconfig')

			-- Server-specific settings. See `:help lspconfig-setup`
			lspconfig.rust_analyzer.setup {
				settings = {
					['rust-analyzer'] = {},
				},
			}
			-- https://ncona.com/2024/02/using-arduino-language-server-with-neovim
			lspconfig.arduino_language_server.setup {}
			lspconfig.clangd.setup {}
			lspconfig.yamlls.setup {
				settings = {
					yaml = {
						format = {
							enable = true
						},
						schemaStore = {
							enable = true
						}
					}
				}
			}

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' },
						},
						format = {
							enable = true,
							-- Put format options here
							-- NOTE: the value should be String!
							defaultConfig = {
								indent_style = 'space',
								indent_size = '2',
							},
						},
					},
				},
			})
		end
	}
}
