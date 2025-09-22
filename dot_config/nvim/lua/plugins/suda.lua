return {
  {
    "https://github.com/lambdalisue/vim-suda",
    config = function()
      vim.g.suda_smart_edit = 1
      vim.g.suda_noninteractive = 1
      vim.g.suda_prompt = "Suda: enter sudo password: "
    end,
  },
}
