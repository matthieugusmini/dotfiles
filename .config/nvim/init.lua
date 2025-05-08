require("config.lazy")
require("config.options")
require("config.autocmds")
require("config.keymaps")

vim.lsp.enable({
	"lua-ls",
	"gopls",
	"golangci-lint-ls",
	"helm-ls",
	"bashls",
	"dockerls",
	"yamlls",
	"jsonls",
})

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
})
