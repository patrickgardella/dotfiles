return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI chat" },
    { "<leader>ci", "<cmd>CodeCompanion<cr>",            mode = { "n", "v" }, desc = "Inline AI assist" },
    { "<leader>cs", "<cmd>CodeCompanionChat add<cr>",    mode = "v",          desc = "Add selection to chat" },
    { "<leader>cx", "<cmd>CodeCompanionActions<cr>",     mode = { "n", "v" }, desc = "AI action picker" },
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              -- Uses the GEMINI_API_KEY environment variable
              api_key = "GEMINI_API_KEY",
            },
            schema = {
              model = {
                default = "gemini-2.5-flash",
              },
            },
          })
        end,
      },
      strategies = {
        chat   = { adapter = "gemini" },
        inline = { adapter = "gemini" },
        agent  = { adapter = "gemini" },
      },
    })
  end,
}
