local M = { "VonHeikemen/lsp-zero.nvim" }

M.dependencies = {
  --"folke/neodev.nvim",
  "williamboman/mason.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    config = { automatic_installation = true, }
  },
}

function M.config()
  require("mason").setup()
  require("mason-lspconfig").setup()

  local lsp = require('lsp-zero')

  lsp.preset('lsp-only')
  lsp.set_preferences({
    set_lsp_keymaps = false
  })
  lsp.setup()
end

return M
