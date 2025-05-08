return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				ensure_installed = {
					"lua",
					"go",
					"typescript",
					"helm",
					"bash",
					"fish",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
