local present, kanagawa = pcall(require, "kanagawa")

if not present then
	return
end

kanagawa.setup({
	commentStyle = { italic = false },
	keywordStyle = { italic = false },
	variablebuiltinStyle = { italic = false },
	transparent = false,
})

vim.cmd("colorscheme kanagawa")
