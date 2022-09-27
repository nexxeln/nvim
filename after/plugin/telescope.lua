local present, telescope = pcall(require, "telescope")

if not present then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local fb_actions = require("telescope").extensions.file_browser.actions

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.setup({
	defaults = {
		file_ignore_patterns = { ".git/", "node_modules" },
		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
		},
	},
	extensions = {
		["ui-select"] = {
			themes.get_cursor({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)

			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("ui-select")
telescope.load_extension("file_browser")

local map = vim.keymap.set

map("n", "<leader>f", function()
	builtin.find_files({})
end)

map("n", "<leader>g", function()
	builtin.live_grep()
end)

map("n", "\\\\", function()
	builtin.buffers()
end)

map("n", "<leader>t", function()
	builtin.help_tags()
end)

map("n", "<leader>;", function()
	builtin.resume()
end)

map("n", "<leader>d", function()
	builtin.diagnostics()
end)

map("n", "sf", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end)
