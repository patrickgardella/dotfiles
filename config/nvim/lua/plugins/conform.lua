return {
  -- https://github.com/stevearc/conform.nvim
  "stevearc/conform.nvim",
  event = "BufWritePre",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua      = { "stylua" },
        rust     = { "rustfmt" },
        bash     = { "shfmt" },
        sh       = { "shfmt" },
        yaml     = { "prettier" },
        markdown = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
