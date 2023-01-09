-- local kanagawa_present, kanagawa = pcall(require, "kanagawa")
-- if not kanagawa_present then
-- 	return
-- end
--
-- kanagawa.setup({
-- 	commentStyle = { italic = false },
-- 	keywordStyle = { italic = false },
-- 	variablebuiltinStyle = { italic = false },
-- 	transparent = false,
-- })
--
-- vim.cmd.colorscheme("kanagawa")

-- vim.cmd.colorscheme("mellow")

local catppuccin_present, catppuccin = pcall(require, "catppuccin")

if not catppuccin_present then
	return
end

catppuccin.setup({
	flavour = "mocha",
	no_italic = true,
	no_bold = true,
	integrations = {
		hop = true,
		fidget = true,
		lsp_trouble = true,
		markdown = true,
	},
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = { "italic" },
			hints = { "italic" },
			warnings = { "italic" },
			information = { "italic" },
		},
		underlines = {
			errors = { "underline" },
			hints = { "underline" },
			warnings = { "underline" },
			information = { "underline" },
		},
	},
})

vim.cmd.colorscheme("catppuccin")
