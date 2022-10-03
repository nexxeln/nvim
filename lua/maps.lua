local map = vim.keymap.set

-- setting leader to space
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- move line up/down
map("n", "<M-j>", "ddp", { silent = true })
map("n", "<M-k>", "ddkP", { silent = true })

-- set line wrap
map("n", "<M-z>", function()
	local wrap_status = vim.api.nvim_exec("set wrap ?", true)

	if wrap_status == "nowrap" then
		vim.api.nvim_command("set wrap linebreak")
		print("Wrap enabled")
	else
		vim.api.nvim_command("set wrap nowrap")
		print("Wrap disabled")
	end
end, { silent = true })

-- trouble.nvim
map("n", "<leader>x", "<cmd>TroubleToggle<CR>", { silent = true })
