require("config.keymaps")
require("config.options")

-- remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- lsp/lsp-zero
local lsp = require('lsp-zero')
lsp.preset('recommended')

--require("elixir").setup()

lsp.setup()

-- mason setup
require("mason").setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'rust_analyzer' },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
  },
  formatting = lsp.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

require('lualine').setup()

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      --'--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('projectionist')

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  highlight = { enable = true },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  -- Using this option may slow down your editor, and you may see some duplicate highlights.
  -- Instead of true it can also be a list of languages
  additional_vim_regex_highlighting = true,
})


--vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme terafox]])
--vim.cmd([[colorscheme kanagawa-wave]])
--vim.cmd[[colorscheme dracula]]
--vim.cmd[[colorscheme dracula-soft]]
--vim.cmd([[colorscheme melange]])
vim.cmd([[colorscheme catppuccin-mocha]])
--vim.cmd([[colorscheme gruvbox]])
--vim.cmd([[colorscheme tokyonight-moon]])
