return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
        require("neotest-go")({
          args = { "-count=1", "-timeout=30s" },
        }),
      },
      summary = {
        animated = true,
        follow = true,
        expand_errors = true,
        mappings = {
          expand = "<CR>",
          expand_all = "e",
          jumpto = "m",
          output = "o",
          short = "O",
          stop = "u",
          run = "r",
        },
      },
      icons = {
        passed = "✔️",
        running = "🏃",
        failed = "❌",
        skipped = "⏭️",
        unknown = "❓",
      },
    })
  end,
}
