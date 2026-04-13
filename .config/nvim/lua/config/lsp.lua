vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
}, { confirm = false })

local lua_ls_library = vim.api.nvim_get_runtime_file("", true)
table.insert(lua_ls_library, vim.fn.stdpath("config"))

-- Let lua_ls see Neovim's runtime and your config so `vim.*` completes.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = lua_ls_library,
			},
		},
	},
})

vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/**",
				["https://taskfile.dev/schema.json"] = "Taskfile.yml",
				["https://goreleaser.com/static/schema-pro.json"] = ".goreleaser.yaml",
				["https://json.schemastore.org/dependabot-2.0.json"] = {
					"/.github/dependabot.yml",
					"/.github/dependabot.yaml",
				},
			},
		},
	},
})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			buildFlags = { "-tags=integration e2e" },
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"golangci_lint_ls",
	"bashls",
	"dockerls",
	"yamlls",
	"jsonls",
	"vtsls",
})
