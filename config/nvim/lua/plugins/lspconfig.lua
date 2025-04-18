return {
	-- https://github.com/williamboman/mason-lspconfig.nvim
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
		-- https://github.com/rcarriga/nvim-dap-ui
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

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

			-- Configure rust_analyzer
			vim.lsp.config('rust_analyzer', {
				settings = {
					['rust-analyzer'] = {
						diagnostics = {
							enable = false
						}
					},
				},
			})

			lspconfig.rust_analyzer.setup {}

			-- Configure the rest of them

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
	},
	{
		-- https://github.com/mfussenegger/nvim-lint
		"mfussenegger/nvim-lint",
		config = function()
			require('lint').linters_by_ft = {
				markdown = { 'vale' },
				lua = { 'luacheck' },
				yaml = { 'yamllint' },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()

					-- You can call `try_lint` with a linter name or a list of names to always
					-- run specific linters, independent of the `linters_by_ft` configuration
					-- require("lint").try_lint("cspell")
				end,
			})
		end,
	},
	{
		-- https://github.com/mhartington/formatter.nvim
		"mhartington/formatter.nvim",
		config = function()
			-- Utilities for creating configurations
			local util = require "formatter.util"

			-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
			require("formatter").setup {
				-- Enable or disable logging
				logging = true,
				-- Set the log level
				log_level = vim.log.levels.WARN,
				-- All formatter configurations are opt-in
				filetype = {
					-- Formatter configurations for filetype "lua" go here
					-- and will be executed in order

					lua = {
						-- "formatter.filetypes.lua" defines default configurations for the
						-- "lua" filetype
						require("formatter.filetypes.lua").stylua,

						-- You can also define your own configuration
						function()
							-- Supports conditional formatting
							if util.get_current_buffer_file_name() == "special.lua" then
								return nil
							end

							-- Full specification of configurations is down below and in Vim help
							-- files
							return {
								exe = "stylua",
								args = {
									"--search-parent-directories",
									"--stdin-filepath",
									util.escape_path(util.get_current_buffer_file_path()),
									"--",
									"-",
								},
								stdin = true,
							}
						end
					},

					hcl = {
						function()
							return {
								exec = "terragrunt",
								args = { "hclfmt" },
								stdin = false
							}
						end
					},

					-- Use the special "*" filetype for defining formatter configurations on
					-- any filetype
					["*"] = {
						-- "formatter.filetypes.any" defines default configurations for any
						-- filetype
						require("formatter.filetypes.any").remove_trailing_whitespace,
						-- Remove trailing whitespace without 'sed'
						-- require("formatter.filetypes.any").substitute_trailing_whitespace,
					}
				}
			}
		end

	}
}
