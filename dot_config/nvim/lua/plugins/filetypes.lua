return {
  {
    "prettier/vim-prettier",
  },
  vim.filetype.add({
    pattern = {
      [".*%.lua%.tmpl"] = "lua",
      [".*%.toml%.tmpl"] = "toml",
      [".*%.bash%.tmpl"] = "sh",
      [".*%.sh%.tmpl"] = "sh",
      [".*%.rc"] = "sh",
      ["%.ansible%-lint"] = "yaml.ansible",
      ["%.ansible%-lint%-ignore"] = "yaml.ansible",
      [".*%.gitlab%-ci.yml"] = "yaml.gitlab",
      [".*%.yml"] = "yaml.ansible",
      [".*%.yaml"] = "yaml.ansible",
      [".*%.j2"] = "jinja",
    },
  }),
}
