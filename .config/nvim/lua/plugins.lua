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

-- load modules
local modules = {
 "coding",
 "ricing",
}

for _, mod in ipairs(modules) do
    require("" .. mod)
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'rose-pine/neovim'
  use {'folke/which-key.nvim'}
  use {'nvim-treesitter/nvim-treesitter'}
	use {'windwp/nvim-ts-autotag'}
	use {'windwp/nvim-autopairs'}
	use {'p00f/nvim-ts-rainbow'}

	use {'ms-jpq/coq_nvim', branch = 'coq'}
	use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

	use 'kyazdani42/nvim-web-devicons'

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {'nvim-tree/nvim-web-devicons'},
  }
	
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = 'true'}
	}
	use {
		'akinsho/bufferline.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = 'true'}
	}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
