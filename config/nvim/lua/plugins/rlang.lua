-- Taken from: 	https://dataalltheway.com/posts/004-how-to-use-neovim-or-vim-as-an-ide-forr/index.html
-- Usage: RMapsDesc

return {
	--"jalvesaq/Nvim-R",
	{
		-- https://github.com/R-nvim/R.nvim
		"R-nvim/R.nvim",
		config = function()
			local rnvim = require("r")
			rnvim.setup({
				objbr_opendf = false,
				objbr_openlist = false,
			})
		end,
		lazy = false,
	},

	"R-nvim/cmp-r",
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = { { name = "cmp_r" } },
				mapping = cmp.mapping.preset.insert({
					['<CR>'] = cmp.mapping.confirm({ select = false }),
					-- During auto-completion, press <Tab> to select the next item.
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						elseif cmp.has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						else
							fallback()
						end
					end, { 'i', 's' }),
				}),
			})
			require("cmp_r").setup({})
		end,
	},

	-- Original article used ncm2 instead of nvim-cmp

	--	{"ncm2/ncm2",
	--	vim.api.nvim_create_autocmd({"BufEnter"}, {
	--		pattern = {"*.R", "*.Rmd"},
	--			callback = function() call ncm2#enable_for_buffer() end,
	--		})
	--	},
	--
	--	"roxma/nvim-yarp",
	--	"gaalcarar/ncm-R"
}
