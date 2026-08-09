return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>cc", "<cmd>CodeCompanionChat toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI chat" },
		{ "<leader>ci", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "Inline AI assist" },
		{ "<leader>cs", "<cmd>CodeCompanionChat add<cr>", mode = "v", desc = "Add selection to chat" },
		{ "<leader>cx", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI action picker" },
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				openrouter = function()
					return require("codecompanion.adapters").extend("openrouter", {
						env = {
							-- Uses the OPENROUTER_API_KEY environment variable
							api_key = "OPENROUTER_API_KEY",
						},
						schema = {
							model = {
								default = "nvidia/nemotron-3-ultra-550b-a55b:free", -- for general use
							},
						},
					})
				end,
				openrouter_coding = function()
					return require("codecompanion.adapters").extend("openrouter", {
						env = { api_key = "OPENROUTER_API_KEY" },
						schema = {
							model = { default = "poolside/laguna-s-2.1:free" },
						},
					})
				end,
			},
			strategies = {
				chat = { adapter = "openrouter" },
				inline = { adapter = "openrouter" },
				agent = { adapter = "openrouter" },
			},
		})
	end,
}
