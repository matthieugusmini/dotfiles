vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MunifTanjim/nui.nvim",
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
})

require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			visible = true,
			hide_gitignored = true,
			hide_dotfiles = false,
		},
	},
	window = {
		width = 30,
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle left<cr>", {
	desc = "Explorer NeoTree",
})
