vim.keymap.set("n", "<leader>l", function()
	vim.pack.update(nil, { offline = true })
end, { desc = "Open vim.pack state" })

vim.keymap.set("n", "<leader>u", "<cmd>Undotree<cr>", {
	desc = "Toggle undo tree",
})

vim.keymap.set("n", "<leader>ygc", "yygccp", {
	desc = "Comment and copy current line below",
	remap = true,
})
