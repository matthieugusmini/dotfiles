return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",          desc = "Telescope find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",           desc = "Telescope live grep" },

      { "gr",         "<cmd>Telescope lsp_references<cr>",      desc = "Goto references" },
      { "gi",         "<cmd>Telescope lsp_implementations<cr>", desc = "Goto implementations" },
      { "gd",         "<cmd>Telescope lsp_definitions<cr>",     desc = "Goto definitions" },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    opts = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
