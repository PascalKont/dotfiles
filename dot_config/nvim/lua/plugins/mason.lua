return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "ansiblels", "jinja_lsp" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {}, lazy = false },
      "neovim/nvim-lspconfig",
    },
  },
}
