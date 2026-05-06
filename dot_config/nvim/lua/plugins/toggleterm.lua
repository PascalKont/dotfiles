return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      shade_terminals = true,
      shading_factor = "-10",
      --shading_ration = '',
      start_in_insert = true,
      close_on_exit = true,
      persist_size = true,
      auto_scroll = true,
    },
    --keys = {
    --  { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat", mode = { "n", "v" } },
    --  { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "AI Inline Assistant", mode = { "n", "v" } },
    --  { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions", mode = { "n", "v" } },
    --},
    keys = {
      {
        "<C-t>",
        function()
          local terms = require("toggleterm.terminal").get_all(true) -- true = only existing terminals
          if #terms > 0 then
            -- Jump to the first existing terminal
            terms[1]:focus()
          else
            -- No terminal exists yet, open a new one
            Snacks.explorer.open()
            vim.cmd("ToggleTerm")
            vim.defer_fn(function()
              Snacks.explorer.open()
            end, 100)
          end
        end,
        mode = { "n", "t", "i" },
        desc = "Focus or open terminal",
      },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<leader>tgs", "<cmd>TermExec cmd='git status'<cr>", desc = "Git Status" },
      { "<C-Esc>", [[<C-\><C-n>]], mode = "t" },
      { "<C-h>", "<Cmd>wincmd h<CR>", mode = "t" },
      { "<C-j>", "<Cmd>wincmd j<CR>", mode = "t" },
      { "<C-k>", "<Cmd>wincmd k<CR>", mode = "t" },
      { "<C-l>", "<Cmd>wincmd l<CR>", mode = "t" },
      { "<C-w>", [[<C-\><C-n><C-w>]], mode = "t" },
    },
    -- keys = {
    --  { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    -- { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    --vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    --vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    --vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    --vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    --vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    --vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    --vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    --vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    --},
  },
}
