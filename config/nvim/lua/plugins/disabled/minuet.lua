return {
	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("minuet").setup({
			provider = "openai_fim_compatible",
			n_completions = 1, -- recommended for local models
			context_window = 512, -- start small, grow gradually
			request_timeout = 3, -- seconds; keep in step with blink's timeout_ms
			-- Delay before triggering completion (ms)
			debounce = 2000,
			provider_options = {
				openai_fim_compatible = {
					api_key = "TERM", -- placeholder env var name, no real key needed
					name = "LM Studio",
					end_point = "http://localhost:1234/v1/completions",
					model = "qwen2.5-coder-1.5b",
					optional = { max_tokens = 56, top_p = 0.9 },
					template = {
						prompt = function(before, after, _)
							return "<|fim_prefix|>" .. before .. "<|fim_suffix|>" .. after .. "<|fim_middle|>"
						end,
						suffix = false,
					},
				},
			},
		})
	end,
}
