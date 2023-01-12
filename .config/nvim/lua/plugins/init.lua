return {
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

  "christoomey/vim-tmux-navigator",
  "dbakker/vim-projectroot",
  "freitass/todo.txt-vim",
  -- Plug 'plasticboy/vim-markdown'
  "elixir-editors/vim-elixir",
  "mhinz/vim-mix-format",
  "editorconfig/editorconfig-vim",

  -- appearance
  {
    "wittyjudge/gruvbox-material.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },
  "lukas-reineke/indent-blankline.nvim",

  {
    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      -- load the colorscheme here
      require("trouble").setup {}
      require 'nvim-web-devicons'.get_icons()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "BurntSushi/ripgrep",
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').load_extension('fzf')
    end,
  },
}
