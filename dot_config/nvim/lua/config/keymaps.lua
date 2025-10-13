-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--['<Up>'] = { 'select_prev', 'fallback' }
--require("blink.cmp")[command]()
--vim.keymap.set("i", "<C-j>", blink.select_next, { desc = "Select next suggestion in intellisense" })
--vim.keymap.set("i", "<C-k>", blink.select_prev, { desc = "Select previous suggestion in intellisense" })
vim.keymap.set("n", "<C-w><C-t>", function()
  vim.cmd("tabnew")
end, { desc = "Open a new tab" })
vim.keymap.set("n", "<C-w><C-w>", function()
  vim.cmd("bprevious | bd #")
end, { desc = "Close current tab" })
