return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
          hide_gitignored = true,
          hide_dotfiles = false,
				},
			},
		},
		lazy = false,
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle left<cr>", desc = "Explorer NeoTree" },
		},
	},
}
