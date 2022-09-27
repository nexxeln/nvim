local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })

		print("Installing packer...")

		vim.cmd([[packadd packer.nvim]])

		return true
	end

	return false
end

local packer_bootstrap = ensure_packer()

-- reload neovim whenever plugins.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		-- color scheme
		use("rebelot/kanagawa.nvim")

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("nvim-treesitter/nvim-treesitter-textobjects")

		-- automatic bracket pairs
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		-- autoclose and rename html tags
		use({
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-ts-autotag").setup({})
			end,
		})

		-- indent guides
		use("lukas-reineke/indent-blankline.nvim")

		-- smooth scrolling
		use("karb94/neoscroll.nvim")

		-- git decorations in files
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})

		-- surround selections
		use("kylechui/nvim-surround")

		-- commenting
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup({
					pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				})
			end,
		})
		use("JoosepAlviste/nvim-ts-context-commentstring")

		-- telescope
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		-- telescope code actions ui
		use("nvim-telescope/telescope-ui-select.nvim")

		-- telescope file browser
		use("nvim-telescope/telescope-file-browser.nvim")

		-- status line
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- lsp
		use("neovim/nvim-lspconfig")

		-- lsp installer
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")

		-- lsp ui
		use("glepnir/lspsaga.nvim")

		-- formatting, code actions and diagnostics
		use({
			"jose-elias-alvarez/null-ls.nvim",
			commit = "76d0573fc159839a9c4e62a0ac4f1046845cdd50",
		})

		-- autocompletion
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-nvim-lua")
		use("hrsh7th/cmp-path")
		use("saadparwaiz1/cmp_luasnip")

		-- snippets
		use("L3MON4D3/LuaSnip")
		use("rafamadriz/friendly-snippets")

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
