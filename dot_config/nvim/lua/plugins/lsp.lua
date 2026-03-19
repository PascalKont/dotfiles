return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      jinja_lsp = {
        settings = {
          diagnostics = {
            undefinedVariables = false,
          },
        },
      },
    },
  },
}
