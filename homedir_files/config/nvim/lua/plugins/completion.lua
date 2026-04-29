return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "*",
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show" },
        ["<C-e>"] = { "cancel" },
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
      completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
      },
    },
  },
}
