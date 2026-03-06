return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
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

    vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat toggle<cr>", { desc = "Toggle AI chat" })
    vim.keymap.set({ "n", "v" }, "<leader>ci", "<cmd>CodeCompanion<cr>", { desc = "Inline AI assist" })
    vim.keymap.set("v", "<leader>cs", "<cmd>CodeCompanionChat add<cr>", { desc = "Add selection to chat" })
    vim.keymap.set({ "n", "v" }, "<leader>cx", "<cmd>CodeCompanionActions<cr>", { desc = "AI action picker" })
  end,
}
