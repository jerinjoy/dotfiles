return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "-" },
        changedelete = { text = "~" },
      },
      on_attach = function(buf)
        local gs = require("gitsigns")
        local map = function(keys, fn, desc)
          vim.keymap.set("n", keys, fn, { buffer = buf, desc = desc })
        end
        map("]h", gs.next_hunk, "Next hunk")
        map("[h", gs.prev_hunk, "Prev hunk")
        map("<leader>hp", gs.preview_hunk, "Preview hunk")
        map("<leader>hr", gs.reset_hunk, "Reset hunk")
        map("<leader>hb", gs.blame_line, "Blame line")
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
}
