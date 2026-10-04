return {
  "saghen/blink.cmp",
  version = "*",
  build = vim.uv.os_uname().sysname == "FreeBSD" and "cargo build --release" or nil,
  opts = {
    keymap = { preset = "enter" },
    fuzzy = {
      implementation = "prefer_rust",
    },
    sources = {
      default = { "lsp", "path", "buffer", "minuet" },
      providers = {
        minuet = {
          name = "minuet",
          module = "minuet.blink",
          async = true,
          timeout_ms = 3000, -- must equal minuet request_timeout * 1000
          score_offset = 50,
        },
      },
    },
    completion = { trigger = { prefetch_on_insert = false } },
  },
}
