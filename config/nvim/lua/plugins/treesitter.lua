return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "asm",
        "arduino",
        "bash",
        "c",
        "c_sharp",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "rust",
        "javascript",
        "html",
        "markdown",
        "markdown_inline",
        "r",
        "rnoweb" },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true
      },
    })
  end,
}
