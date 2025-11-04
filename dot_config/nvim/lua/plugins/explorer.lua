return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
        trash = "true",

        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        sources = {
          explorer = {
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
            autoclose = true,
            hidden = true,
            ignored = true,
            layout = {
              preset = "sidebar",
              hidden = { "preview" },
              auto_hide = { "input" },
              relative = "win",
            },
          },
        },
      },
    },
  },
}
