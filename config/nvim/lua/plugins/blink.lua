return {
  "saghen/blink.cmp",
  version = "*",
  build = vim.loop.os_uname().sysname == "FreeBSD" and "cargo build --release" or nil,
  opts = {
    keymap = { preset = "default" },
    fuzzy = {
      implementation = "prefer_rust",
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
  },
}
