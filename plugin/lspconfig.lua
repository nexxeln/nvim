local present, nvim_lsp = pcall(require, "lspconfig")

if not present then
	return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
	buf_set_keymap("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
	buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
	buf_set_keymap("n", "<C-j>", "<Cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
	buf_set_keymap("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- recognize the `vim` global
				globals = { "vim" },
			},

			workspace = {
				-- neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

nvim_lsp.jsonls.setup({
	capabilities = capabilities,
})

nvim_lsp.tailwindcss.setup({})

nvim_lsp.html.setup({
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	capabilities = capabilities,
})

nvim_lsp.emmet_ls.setup({})

nvim_lsp.gopls.setup({})

nvim_lsp.marksman.setup({})

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
})

nvim_lsp.astro.setup({})

nvim_lsp.svelte.setup({})

nvim_lsp.prismals.setup({})

nvim_lsp.elixirls.setup({
	cmd = { "/home/nxl/Downloads/elixir-ls/language_server.sh" },
})

nvim_lsp.pyright.setup({
	on_attach = on_attach,
})

nvim_lsp.ocamlls.setup({
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
	root_dir = nvim_lsp.util.root_pattern(
		"*.opam",
		"esy.json",
		"package.json",
		".git",
		"dune-project",
		"dune-workspace"
	),
	on_attach = on_attach,
	capabilities = capabilities,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always",
	},
})
