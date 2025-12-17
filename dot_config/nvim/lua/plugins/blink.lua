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
        auto_show_delay_ms = 100,
      },
      ghost_text = {
        -- enabled = vim.g.ai_cmp,
        enabled = true,
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
    keymap = {
      preset = "none", -- Disable default keymaps

      ["<C-l>"] = { "accept", "fallback" }, -- Accept suggestion
      ["<C-k>"] = { "select_prev", "fallback" }, -- Previous suggestion
      ["<C-j>"] = { "select_next", "fallback" }, -- Next suggestion
      ["<Right>"] = { "accept", "fallback" }, -- Accept suggestion
      ["<Up>"] = { "select_prev", "fallback" }, -- Previous suggestion
      ["<Down>"] = { "select_next", "fallback" }, -- Next suggestion

      ["<Tab>"] = { "fallback" }, -- Always insert tab
      ["<S-Tab>"] = { "fallback" }, -- Always insert shift-tab

      -- Optional: Keep these for convenience
      ["<C-space>"] = { "show", "hide" }, -- Toggle completion menu
      ["<C-e>"] = { "hide", "fallback" }, -- Close menu
      ["<C-y>"] = { "accept", "fallback" }, -- Alternative accept

      -- Scroll documentation
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
  },
}
