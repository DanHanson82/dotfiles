local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- from the myth, the man, the legend
  -- git plugin so awesome it should be illegal
  use "tpope/vim-fugitive"
  use "tpope/vim-abolish"
  use "tpope/vim-sensible"
  use "tpope/vim-sleuth"
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"
  use "tpope/vim-vinegar"
  use "tpope/vim-projectionist"

  use "christoomey/vim-tmux-navigator"
  -- use "dbakker/vim-projectroot"
  use "freitass/todo.txt-vim"
  -- Plug 'plasticboy/vim-markdown'
  -- use "elixir-editors/vim-elixir"
  -- elixirls lsp format sometimes has issues so keeping this as backup
  -- use "mhinz/vim-mix-format"
  -- see if colors are working after treesitter config changes
  -- use "hashivim/vim-terraform"
  use "editorconfig/editorconfig-vim"
  -- install one of these for the correct file icons https://www.nerdfonts.com/font-downloads
  use "kyazdani42/nvim-web-devicons"

  --use { "ellisonleao/gruvbox.nvim" }
  --use 'folke/tokyonight.nvim'
  -- use "savq/melange-nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  --use 'rebelot/kanagawa.nvim'
  --use "EdenEast/nightfox.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = {
      options = { theme = 'gruvbox' }
    },
  }

  -- install rust and then run the following to install a working version of tree-sitter-cli
  -- cargo install tree-sitter-cli --git https://github.com/tree-sitter/tree-sitter.git
  -- TSInstall elixir
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  -- for using treesitter playground
  -- :TSInstall query
  use "nvim-treesitter/playground"
  use "lewis6991/spellsitter.nvim"

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'BurntSushi/ripgrep' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }
  }
  use { "adalessa/telescope-projectionist.nvim" }
  use 'folke/lsp-colors.nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- :h mason-commands
  -- :Mason - opens a graphical status window
  -- :MasonInstall <package> ..."
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
