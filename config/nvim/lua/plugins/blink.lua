return {
  "saghen/blink.cmp",
  version = "*",
  build = vim.loop.os_uname().sysname == "FreeBSD" and "cargo build --release" or nil,
  dependencies = { "milanglacier/minuet-ai.nvim" },
  opts = {
    keymap = { preset = "default" },
    fuzzy = {
      implementation = "prefer_rust",
    },
    sources = {
      default = { "lsp", "path", "buffer", "minuet" },
      providers = {
        minuet = {
          name = "minuet",
          module = "minuet.blink",
          score_offset = 8,
        },
      },
    },
  },
}
