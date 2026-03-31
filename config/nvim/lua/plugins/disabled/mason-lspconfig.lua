-- https://github.com/williamboman/mason-lspconfig.nvim

-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/stevearc/conform.nvim

-- One user used "efm" (go-lang) as the formatter, linter, etc.
-- He also used `event = "BufReadPre"`

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    'williamboman/mason.nvim',
  },

  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "jsonls", "yamlls" },
      -- automatic_enable = false, --disable
    })
  end
}
