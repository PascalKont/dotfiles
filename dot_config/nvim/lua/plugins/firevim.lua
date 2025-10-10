return {
  {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)",
  },
  {
    "folke/noice.nvim",
    enabled = false,
    cond = function()
      local uis = vim.api.nvim_list_uis()
      -- If any attached UI supports ext_cmdline, skip loading Noice
      for _, ui in ipairs(uis) do
        if ui.ext_cmdline then
          return false
        end
      end
      return true
    end,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      -- your Noice config here
    },
  },
}
