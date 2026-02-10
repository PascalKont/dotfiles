return {
  "https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git",
  enabled = false,
  -- Activate when a file is created/opened
  event = { "BufReadPre", "BufNewFile" },

  -- Activate when a supported filetype is open
  ft = {
    "c",
    "cpp",
    "cs",
    "go",
    "sql",
    "haml",
    "java",
    "javascript",
    "kotlin",
    "php",
    "python",
    "ruby",
    "rust",
    "scala",
    "sh",
    "svelte",
    "swift",
    "typescript",
    "vue",
  },
  cond = function()
    -- Only activate if token is present in environment variable.
    -- Remove this line to use the interactive workflow.
    return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
  end,

  -- Plugin configuration
  config = function()
    -- Define all supported filetypes
    -- as documented here: https://docs.gitlab.com/user/project/repository/code_suggestions/supported_extensions/#supported-languages-by-ide
    local supported_filetypes = {
      "c",
      "cpp",
      "cs",
      "go",
      "sql",
      "haml",
      "java",
      "javascript",
      "kotlin",
      "php",
      "python",
      "ruby",
      "rust",
      "scala",
      "sh",
      "svelte",
      "swift",
      "typescript",
      "vue",
    }
    require("gitlab").setup({
      -- your settings
      options = {
        code_suggestions = {
          auto_filetypes = { "*" },
        },
      },
    })

    -- Create autocommand to disable Copilot for supported filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "go", "javascript", "python", "ruby", "typescript", "lua" },
      callback = function()
        -- Disable Copilot for this buffer
        vim.b.copilot_enabled = false
      end,
    })

    -- Re-enable Copilot for unsupported filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        local supported_fts = { "go", "javascript", "python", "ruby", "typescript", "lua" }
        local current_ft = vim.bo.filetype

        -- If not a supported filetype, enable Copilot
        if not vim.tbl_contains(supported_fts, current_ft) then
          vim.b.copilot_enabled = true
        end
      end,
    })
  end,
}
