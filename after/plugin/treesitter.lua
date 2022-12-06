local present, ts = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
local install_config = require("nvim-treesitter.install")

install_config.compilers = { "gcc", "clang" }

ts.setup({
	auto_install = true,
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	matchup = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	ensure_installed = {
		"astro",
		"bash",
		"css",
		"elixir",
		"go",
		"gomod",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"ocaml",
		"prisma",
		"python",
		"rust",
		"svelte",
		"toml",
		"tsx",
		"typescript",
		"yaml",
	},
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = false,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm

				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",

				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
			},
			-- You can choose the select mode (default is charwise 'v')
			selection_modes = {

				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding xor succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in

			-- `ap`.
			include_surrounding_whitespace = true,
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		lsp_interop = {
			enable = true,
			border = "none",
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
	},
})

parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
