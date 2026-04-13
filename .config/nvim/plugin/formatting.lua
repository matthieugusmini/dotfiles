vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofumpt" },
    yaml = { "yamlfmt" },
    json = { "jq" },
    sql = { "pg_format" },
  },
  formatters = {
    yamlfmt = {
      cmd = "yamlfmt",
      args = { "-formatter", "retain_line_breaks_single=true", "-" },
    },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
})

vim.keymap.set("n", "<leader>gf", function()
  require("conform").format({ async = true })
end, { desc = "Format file" })
