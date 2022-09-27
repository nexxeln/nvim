local present, surround = pcall(require, "nvim-surround")

if not present then
	return
end

surround.setup({})
