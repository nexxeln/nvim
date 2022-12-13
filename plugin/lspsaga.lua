local map = vim.keymap.set
local present, saga = pcall(require, "lspsaga")
local catppuccin_present, catppuccin = pcall(require, "catppuccin.groups.integrations.lsp_saga")

if not present then
	return
end

if not catppuccin_present then
	return
end

saga.init_lsp_saga({
	border_style = "rounded",
	symbol_in_winbar = {
		enable = false,
	},
	custom_kind = catppuccin.custom_kind(),
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Rename
map("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
--
-- Outline
map("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })

-- Hover Doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
