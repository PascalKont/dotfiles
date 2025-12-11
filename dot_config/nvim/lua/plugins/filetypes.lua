return {
  {
    "prettier/vim-prettier",
  },
  vim.filetype.add({
    pattern = {
      [".*%.toml%.tmpl"] = "toml",
      [".*%.bash%.tmpl"] = "bash",
      [".*%.sh%.tmpl"] = "sh",
      ["%.ansible%-lint"] = "yaml.ansible",
      [".*%.gitlab%-ci.yml"] = "yaml.gitlab",
      [".*%.yml"] = "yaml.ansible",
    },
  }),
}
