return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      render_modes = true,
      preset = "lazy",
    },
    config = function()
      vim.api.nvim_set_hl(0, "MarkdownTitle", { link = "GruvboxFg1" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH1", { link = "GruvboxFg1" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2", { link = "GruvboxFg1" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3", { link = "GruvboxFg1" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4", { link = "GruvboxFg1" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5", { link = "GruvboxFg1" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6", { link = "GruvboxFg1" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#3c3836" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { link = "RenderMarkdownH1Bg" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { link = "RenderMarkdownH1Bg" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { link = "RenderMarkdownH1Bg" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { link = "RenderMarkdownH1Bg" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { link = "RenderMarkdownH1Bg" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#a89984" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#928374" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#7c6f64" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#665c54" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#504945" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#3c3836" })
      -- vim.api.nvim_set_hl(0, "Title", { fg = "#00ffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownCode", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownCodeInfo", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownCodeFallback", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownQuote1", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownQuote2", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownQuote3", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownQuote4", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownQuote5", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownQuote6", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownInlineHighlight", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownDash", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownSign", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownMath", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownIndent", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownHtmlComment", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownLink", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownWikiLink", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownChecked", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownTodo", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownTableHead", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownTableRow", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownTableFill", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownSuccess", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownInfo", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownHint", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownWarn", { fg = "#ffffff" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownError", { fg = "#ffffff" })
    end,
  },
}
