return {
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      ansible = { "prettier" },
      ["yaml.ansible"] = { "prettier" },
    },
  }),
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ async = false })
    end,
  }),
}
