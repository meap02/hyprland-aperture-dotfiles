local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	

	--nvim-web-devicons
	use("nvim-tree/nvim-web-devicons") -- Add entry here to install the plugin
	
	--Telescope
	use("nvim-lua/plenary.nvim") -- Lua functions that Telescope plugin use
	use("nvim-telescope/telescope.nvim")

	-- Install Which Key
	use ("folke/which-key.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	
	-- treesitter configuration
	use({
	  "nvim-treesitter/nvim-treesitter",
	  run = function()
	    local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
	    ts_update()
	  end,
	})
	use("HiPhish/nvim-ts-rainbow2")

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- Colerizor
	use("norcalli/nvim-colorizer.lua")

	-- Managing & installing LSP servers, linters & formatters
	use("williamboman/mason.nvim") -- In charge of managing LSP servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- Bridges the gap between mason & lspconfig

	-- Configuring LSP servers
	use("neovim/nvim-lspconfig") -- Easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- For autocompletion
	use({
	  "glepnir/lspsaga.nvim",
	  branch = "main",
	  requires = {
	    { "nvim-tree/nvim-web-devicons" },
	    { "nvim-treesitter/nvim-treesitter" },
	  },
	}) -- Enhanced LSP UIs
	use("jose-elias-alvarez/typescript.nvim") -- Additional functionality for TypeScript server (e.g., rename file & update imports)
	use("onsails/lspkind.nvim") -- VSCode-like icons for autocompletion

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
