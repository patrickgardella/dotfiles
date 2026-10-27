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
      default = { "lsp", "path", "buffer" },
    },
    completion = { trigger = { prefetch_on_insert = false } },
  },
}
