return {
	"stevearc/conform.nvim",
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "golangci-lint" },
			yaml = { "yamlfmt" },
			json = { "jq" },
			sql = { "pg_format" },
		},
		formatters = {
			yamlfmt = {
				cmd = "yamlfmt",
				-- By default conform send the file content to stdin and read the formatted output from stdout.
				-- However the default behavior of yamlfmt is to rewrite the file directly so
				-- we need the "-" argument to follow conform behavior.
				--
				-- See: https://github.com/google/yamlfmt/blob/main/docs/command-usage.md#three-modes-of-operation
				args = { "-formatter", "retain_line_breaks_single=true", "-" },
			},
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format file",
		},
	},
}
