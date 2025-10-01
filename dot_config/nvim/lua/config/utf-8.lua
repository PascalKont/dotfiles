-- Set default encoding options
vim.o.encoding = "utf-8" -- internal encoding
vim.o.fileencoding = "utf-8" -- encoding used when writing files
vim.o.fileencodings = "utf-8" -- encodings tried when reading files
vim.o.bomb = false -- do not write BOM (Byte Order Mark)

-- Force UTF-8 for all new/opened files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.fileencoding = "utf-8"
  end,
})
