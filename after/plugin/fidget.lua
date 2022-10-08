local present, fidget = pcall(require, "fidget")

if not present then
	return
end

fidget.setup({
	text = {
		spinner = "earth",
		done = "🗸",
	},
	timer = {
		spinner_rate = 150,
	},
	sources = {
		["null-ls"] = {
			ignore = true,
		},
	},
})
