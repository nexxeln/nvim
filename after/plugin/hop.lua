local present, hop = pcall(require, "hop")

if not present then
	return
end

local directions = require("hop.hint").HintDirection

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
})

local map = vim.keymap.set

map("n", "<leader>w", function()
	hop.hint_words()
end)

map("n", "<M-f>", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end)

map("n", "<M-F>", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end)

map("n", "<M-t>", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end)

map("n", "<M-T>", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end)
