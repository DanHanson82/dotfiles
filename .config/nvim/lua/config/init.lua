require("config.keymaps")
require("config.options")


local augroup = vim.api.nvim_create_augroup
local ThePotatoGroup = augroup('potato', {})
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
    pattern = "*",
    group = ThePotatoGroup,
    command = [[%s/\s\+$//e]],
})

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

require("mason").setup()
require("mason-lspconfig").setup()

require('lualine').setup()
