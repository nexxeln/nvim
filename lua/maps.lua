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
map("n", ";j", "ddp", { silent = true })
map("n", ";k", "ddkP", { silent = true })

-- set line wrap
map("n", "<M-z>", ":set wrap linebreak<CR>", { silent = true })
