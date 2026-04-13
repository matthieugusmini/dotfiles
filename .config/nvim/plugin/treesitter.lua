local ensure_installed = {
	"lua",
	"go",
	"gomod",
	"gosum",
	"gowork",
	"javascript",
	"typescript",
	"tsx",
	"json",
	"yaml",
	"bash",
	"dockerfile",
	"fish",
	"markdown",
	"markdown_inline",
}

local highlight_filetypes = {
	"lua",
	"go",
	"gomod",
	"gosum",
	"gowork",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"json",
	"yaml",
	"bash",
	"sh",
	"dockerfile",
	"fish",
	"markdown",
}

local indent_filetypes = {
	"lua",
	"go",
	"typescript",
	"typescriptreact",
	"bash",
	"sh",
	"fish",
	"markdown",
}

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		version = "main",
	},
})

require("nvim-treesitter").install(ensure_installed):wait()

require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
	},
	move = {
		set_jumps = true,
	},
})

local textobjects_select = require("nvim-treesitter-textobjects.select")
local textobjects_move = require("nvim-treesitter-textobjects.move")

vim.keymap.set({ "x", "o" }, "af", function()
	textobjects_select.select_textobject("@function.outer", "textobjects")
end, { desc = "Select around function" })

vim.keymap.set({ "x", "o" }, "if", function()
	textobjects_select.select_textobject("@function.inner", "textobjects")
end, { desc = "Select inside function" })

vim.keymap.set({ "x", "o" }, "ac", function()
	textobjects_select.select_textobject("@class.outer", "textobjects")
end, { desc = "Select around class" })

vim.keymap.set({ "x", "o" }, "ic", function()
	textobjects_select.select_textobject("@class.inner", "textobjects")
end, { desc = "Select inside class" })

vim.keymap.set({ "x", "o" }, "aa", function()
	textobjects_select.select_textobject("@parameter.outer", "textobjects")
end, { desc = "Select around parameter" })

vim.keymap.set({ "x", "o" }, "ia", function()
	textobjects_select.select_textobject("@parameter.inner", "textobjects")
end, { desc = "Select inside parameter" })

vim.keymap.set({ "n", "x", "o" }, "]m", function()
	textobjects_move.goto_next_start("@function.outer")
end, { desc = "Next function start" })

vim.keymap.set({ "n", "x", "o" }, "]M", function()
	textobjects_move.goto_next_end("@function.outer")
end, { desc = "Next function end" })

vim.keymap.set({ "n", "x", "o" }, "[m", function()
	textobjects_move.goto_previous_start("@function.outer")
end, { desc = "Previous function start" })

vim.keymap.set({ "n", "x", "o" }, "[M", function()
	textobjects_move.goto_previous_end("@function.outer")
end, { desc = "Previous function end" })

local group = vim.api.nvim_create_augroup("treesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = highlight_filetypes,
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = indent_filetypes,
	callback = function(ev)
		vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
