return {
  vim.filetype.add({
    pattern = {
      [".*%.toml%.tmpl"] = "toml",
      [".*%.sh%.tmpl"] = "sh",
    },
  }),
}
