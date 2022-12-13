-- local kanagawa_present, kanagawa = pcall(require, "kanagawa")
--
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

local catppuccin_present, catppuccin = pcall(require, "catppuccin")

if not catppuccin_present then
	return
end

catppuccin.setup({
	integrations = {
		fidget = true,
		hop = true,
	},
})

vim.cmd.colorscheme("catppuccin-mocha")
