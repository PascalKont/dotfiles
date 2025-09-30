return {
  "saghen/blink.cmp",
  optional = false,
  opts = {
    snippets = {
      expand = function(snippet, _)
        return LazyVim.cmp.expand(snippet)
      end,
    },
    cmdline = {
      enabled = true,
      keymap = {
        preset = "super-tab",
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
      completion = {
        list = { selection = { preselect = false } },
        menu = {
          auto_show = function(ctx)
            return vim.fn.getcmdtype() == ":"
          end,
        },
        ghost_text = { enabled = true },
      },
    },
    completion = {
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = vim.g.ai_cmp,
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
    },
    keymap = {
      preset = "super-tab",
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      --["<C-Tab>"] = { "select_and_accept" },
    },
  },
}
