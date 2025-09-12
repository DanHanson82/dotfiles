return {
  { 'folke/lsp-colors.nvim' },

  {
    'VonHeikemen/lsp-zero.nvim',
    --branch = 'v3.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'mason-org/mason.nvim' },
      { 'mason-org/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, }
  }
}
