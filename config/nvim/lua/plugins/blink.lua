return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "milanglacier/minuet-ai.nvim" },
  opts = {
    keymap = { preset = "default" },
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
