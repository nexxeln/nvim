local mason_present, mason = pcall(require, "mason")

if not mason_present then
	return
end

local lspconfig_present, lspconfig = pcall(require, "mason-lspconfig")

if not lspconfig_present then
	return
end

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

lspconfig.setup({
	ensure_installed = {
		"sumneko_lua",
		"tsserver",
		"html",
		"cssls",
		"elixirls",
		"gopls",
		"jsonls",
		"marksman",
		"tailwindcss",
		"emmet_ls",
		"rust_analyzer",
	},
})
