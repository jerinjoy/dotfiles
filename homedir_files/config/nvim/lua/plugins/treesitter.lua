return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    opts = {
      ensure_installed = {
        "bash", "c", "cpp", "fish",
        "html", "javascript", "json",
        "lua", "markdown", "markdown_inline",
        "python", "rust", "tsx", "typescript",
        "vim", "vimdoc", "yaml",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
  },
}
