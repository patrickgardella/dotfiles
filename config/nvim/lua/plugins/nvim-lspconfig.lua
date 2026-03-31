return {
  "neovim/nvim-lspconfig",
  -- event = { "BufReadPre", "BufNewFile" }, -- Load as soon as you open any file
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    -- Pass blink.cmp capabilities to all LSP servers
    vim.lsp.config('*', {
      capabilities = require('blink.cmp').get_lsp_capabilities()
    })

    -- This ensures the Bridge is ready
    require("mason-lspconfig").setup({
      ensure_installed = { "jsonls", "lua_ls" },
    })
  end,
}
