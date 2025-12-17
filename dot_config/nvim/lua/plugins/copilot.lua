return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Copilot settings
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""

    -- Custom keybindings
    vim.keymap.set("i", "<C-L>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
    vim.keymap.set("i", "<C-H>", "<Plug>(copilot-dismiss)", {})
    vim.keymap.set("i", "<C-J>", "<Plug>(copilot-next)", {})
    vim.keymap.set("i", "<C-K>", "<Plug>(copilot-previous)", {})
  end,
}
