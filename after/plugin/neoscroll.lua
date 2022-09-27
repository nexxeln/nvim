local present, neoscroll = pcall(require, "neoscroll")

if not present then
	return
end

neoscroll.setup({
	hide_cursor = false,
})
