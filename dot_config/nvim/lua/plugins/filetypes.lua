return {
  vim.filetype.add({
    pattern = {
      [".*%.toml%.tmpl"] = "toml",
      [".*%.bash%.tmpl"] = "bash",
      [".*%.sh%.tmpl"] = "sh",
    },
  }),
}
