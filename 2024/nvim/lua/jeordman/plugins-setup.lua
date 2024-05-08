local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

-- reload neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer") -- try to import packer, if failed return
if not status then
	return
end

vim.cmd("highlight NewFileDiff ctermbg=lightblue guibg=lightblue")
vim.cmd("sign define NewFileDiff linehl=NewFileDiff")
vim.cmd(
	"autocmd BufEnter * if &diff && winnr() == winnr('$') | execute 'sign place 99999 line=1 name=NewFileDiff buffer=' . bufnr('') | endif"
)

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("goolord/alpha-nvim") -- dashboard

	-- lua functions for other plugins
	use("nvim-lua/plenary.nvim")

	-- use("bluz71/vim-nightfly-guicolors") -- colorscheme
	-- use("ribru17/bamboo.nvim")
	use("folke/tokyonight.nvim")
	use("craftzdog/solarized-osaka.nvim")
	use("catppuccin/nvim")

	-- tmux split
	use("christoomey/vim-tmux-navigator")

	-- tmux split
	use("szw/vim-maximizer") -- maximize and restore curr window

	-- essential?
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	-- commenting out gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-live-grep-args.nvim" })

	-- autocomplete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- manage and install lsp servers, linters, and formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use("Djancyp/better-comments.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")

	use("github/copilot.vim")

	use({ "mg979/vim-visual-multi", branch = "master" })

	use("JoosepAlviste/nvim-ts-context-commentstring")

	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- train vim
	use("ThePrimeagen/vim-be-good")
	use("nvim-treesitter/nvim-treesitter-context")

	-- use({
	-- 	"rcarriga/nvim-notify",
	-- 	config = function()
	-- 		require("notify").setup({
	-- 			routes = {
	-- 				{
	-- 					filter = {
	-- 						event = "notify",
	-- 						find = "No information available",
	-- 					},
	-- 					opts = {
	-- 						skip = true,
	-- 					},
	-- 				},
	-- 				-- your other opts
	-- 			},
	-- 			stages = "fade",
	-- 			render = "minimal",
	-- 			background_colour = "NotifyBackground",
	-- 			timeout = 100,
	-- 		})
	-- 		vim.notify = require("notify")
	-- 	end,
	-- })
	-- use("rcarriga/nvim-notify")
	use("MunifTanjim/nui.nvim")
	use("folke/noice.nvim", {
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
