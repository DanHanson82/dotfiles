return {
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

  -- "ludovicchabant/vim-gutentags"
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
  --
  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'BurntSushi/ripgrep' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    }
  },
  { "dimaportenko/project-cli-commands.nvim" },
}
