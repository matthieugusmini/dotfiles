return {
	cmd = { "yaml-language-server", "--stdio" },
	root_markers = { ".git" },
	filetypes = { "yaml", "yaml.docker-compose" },
	settings = {
		redhat = {
			telemetry = {
				enabled = true,
			},
		},
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/**",
				["https://taskfile.dev/schema.json"] = "Taskfile.yml",
				["https://goreleaser.com/static/schema-pro.json"] = ".goreleaser.yaml",
				["https://json.schemastore.org/dependabot-2.0.json"] = "dependabot.yml",
			},
		},
	},
}
