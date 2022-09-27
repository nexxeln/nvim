local present, indent = pcall(require, "indent_blankline")

if not present then
	return
end

indent.setup({})
