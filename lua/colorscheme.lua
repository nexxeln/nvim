local kanagawa_present, kanagawa = pcall(require, "kanagawa")

if not kanagawa_present then
	return
end

kanagawa.setup({
	commentStyle = { italic = false },
	keywordStyle = { italic = false },
	variablebuiltinStyle = { italic = false },
	transparent = true,
})

vim.cmd("colorscheme kanagawa")

-- local no_clown_present, no_clown_fiesta = pcall(require, "no-clown-fiesta")
--
-- if not no_clown_present then
-- 	return
-- end
--
-- no_clown_fiesta.setup({})
