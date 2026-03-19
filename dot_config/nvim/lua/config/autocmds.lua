-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-format settings for git config files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*/.git/config", "*/.gitconfig", "*/gitconfig" },
  group = vim.api.nvim_create_augroup("GitConfigSettings", { clear = true }),
  callback = function()
    -- Tab settings - Git config expects tabs, not spaces
    vim.opt_local.expandtab = false -- Use actual tabs, not spaces
    vim.opt_local.tabstop = 8 -- Display tabs as 8 spaces
    vim.opt_local.shiftwidth = 8 -- Indentation width matches tabstop
    vim.opt_local.softtabstop = 8 -- Tab behavior in insert mode

    -- Line wrapping settings
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true

    -- Additional useful settings for git config
    vim.opt_local.textwidth = 0
    vim.opt_local.formatoptions:remove("t")
  end,
})
