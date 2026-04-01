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
        json     = { "prettierd" },
        yaml     = { "prettierd" },
        markdown = { "prettierd" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
