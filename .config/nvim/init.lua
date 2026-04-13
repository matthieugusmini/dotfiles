vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.pack")
require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.diagnostics")
require("config.lsp")
