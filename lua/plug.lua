
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
	print("Installing packer close and reopen Neovim")
	--vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plug.lua source <afile> | PackerSync
  augroup end
]]
)
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

-- Install individual plugins here
--local use = require('packer').use
return require('packer').startup(function(use) 
  -- [[ Plugins Go Here ]]
  use { 'wbthomason/packer.nvim' } 

  -- Startup screen
  use {
      'startup-nvim/startup.nvim',
      requires = 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim',
      config = function()
      require("startup").setup()
  end }

    
  
  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }        -- filesystem icons
  }
  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    requires = {'kyazdani42/nvim-web-devicons',
                opt = true}
  }
  use {
    'nvim-telescope/telescope.nvim',                 -- fuzzy finder
    requires = { {'nvim-lua/plenary.nvim'} }
  }
 
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end}

  use { 'DanilaMihailov/beacon.nvim' }              -- helps to see cursor jump

  --use {("folke/which-key.nvim")}
  use {
    "folke/which-key.nvim",
      config = function()
      require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
  -- colorthemes
  --use {'folke/tokyonight.nvim'}
  use {'navarasu/onedark.nvim'}
 
 -- Completion
  use { 'christianchiarulli/nvim-cmp' }
  use { 'hrsh7th/nvim-cmp' }     --replaces old nvim-cmpe
  use { 'hrsh7th/cmp-buffer' }   -- buffer completions
  use { 'hrsh7th/cmp-path' }    -- path completions
  use { 'hrsh7th/cmp-cmdline' } -- cmdline completions
  use { 'saadparwaiz1/cmp_luasnip' } -- snippet completions
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-emoji' }
  use { 'hrsh7th/cmp-nvim-lua' }


-- Git
  use { 'lewis6991/gitsigns.nvim' }
  use { 'kdheepak/lazygit.nvim' }
  use { 'majutsushi/tagbar' }                        -- code structure
  use { 'Yggdroot/indentLine' }                      -- see indentation
  use { 'tpope/vim-fugitive' }                       -- git integration
  use { 'junegunn/gv.vim' }                          -- commit history
  use { 'windwp/nvim-autopairs' }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

--LSP Install and  Config     
  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
    }
  use { 'nvim-lua/completion-nvim' }
  use { 'nvim-orgmode/orgmode', config = function()
          require('orgmode').setup{}
  end
  }

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync() 
  end
end)





