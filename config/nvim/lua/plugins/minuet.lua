return {
  "milanglacier/minuet-ai.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("minuet").setup({
      provider = "gemini",
      provider_options = {
        gemini = {
          -- Uses the GEMINI_API_KEY environment variable
          model = "gemini-2.0-flash",
        },
      },
      -- Delay before triggering completion (ms)
      debounce = 400,
      -- Max tokens to generate per completion
      n_completions = 2,
    })
  end,
}
