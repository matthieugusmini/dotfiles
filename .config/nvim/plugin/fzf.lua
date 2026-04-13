vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/ibhagwan/fzf-lua",
})

local fzf = require("fzf-lua")

fzf.setup({
	fzf_colors = true,
	files = {
		hidden = false,
		no_ignore = false,
	},
})

fzf.register_ui_select()

vim.keymap.set("n", "<leader>ff", function()
	fzf.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
	fzf.live_grep()
end, { desc = "Live grep" })

vim.keymap.set("n", "gr", function()
	fzf.lsp_references()
end, { desc = "Goto references" })

vim.keymap.set("n", "gi", function()
	fzf.lsp_implementations()
end, { desc = "Goto implementations" })

vim.keymap.set("n", "gd", function()
	fzf.lsp_definitions()
end, { desc = "Goto definitions" })
