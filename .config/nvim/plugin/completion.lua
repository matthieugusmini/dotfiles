vim.pack.add({
  {
    src = "https://github.com/L3MON4D3/LuaSnip",
    version = vim.version.range("2.x"),
  },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.x"),
  },
})

require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<S-tab>"] = { "select_prev", "fallback" },
    ["<tab>"] = { "select_next", "fallback" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    menu = {
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind", gap = 1 },
        },
      },
    },
    documentation = { auto_show = true },
    ghost_text = { enabled = true },
  },
  snippets = { preset = "luasnip" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  signature = { enabled = true },
})
