local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",

  -- from the myth, the man, the legend
  -- git plugin so awesome it should be illegal
  "tpope/vim-fugitive",
  "tpope/vim-abolish",
  "tpope/vim-sensible",
  "tpope/vim-sleuth",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",
  "tpope/vim-vinegar",

  -- use "ludovicchabant/vim-gutentags"
  "mhinz/vim-mix-format",
  "christoomey/vim-tmux-navigator",
  "freitass/todo.txt-vim",
  "editorconfig/editorconfig-vim",
  -- install one of these for the correct file icons https://www.nerdfonts.com/font-downloads
  'nvim-tree/nvim-web-devicons',

  { "catppuccin/nvim",    name = "catppuccin", priority = 1000 },
  "lukas-reineke/indent-blankline.nvim",
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = true
  },

  -- install rust and then run the following to install a working version of tree-sitter-cli
  -- cargo install tree-sitter-cli --git https://github.com/tree-sitter/tree-sitter.git
  { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
  -- for using treesitter playground
  -- :TSInstall query
  "nvim-treesitter/playground",
  "lewis6991/spellsitter.nvim",

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'BurntSushi/ripgrep' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
      --{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
      --
    }
  },
  'folke/lsp-colors.nvim',
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  -- :h mason-commands
  -- :Mason - opens a graphical status window
  -- :MasonInstall <package> ..."
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
})
