-- TODO: Move to separate folder
return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    luasnip = true,
  },
  build = ':lua require("go.install").update_all_sync()',
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  keys = {
    { "<C-i>", "<cmd>GoImports<cr>", { desc = "goimports" } },
  },
}
