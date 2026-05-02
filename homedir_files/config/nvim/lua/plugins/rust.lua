return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended for Neovim 0.10+
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- You can add rust-specific keymaps here
            -- The standard LSP keymaps from lsp.lua will still apply
            -- because they are defined in an LspAttach autocmd
          end,
          default_settings = {
            -- rust-analyzer language server settings
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
              inlayHints = {
                typeHints = { enable = true },
                parameterHints = { enable = true },
                chainingHints = { enable = true },
              },
            },
          },
        },
      }
    end,
  },
}
