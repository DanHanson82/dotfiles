------------------------------------------------------------
-- Keyboard Mappings
------------------------------------------------------------

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local set = vim.keymap.set

-- lsp
set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
set('n', '<space>li', ':LspInfo<Return>')
set('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
set('n', '<leader>lh ', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- method textDocument/rename is not supported by any of the servers registered for the current buffer
set('n', '<silent>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

set('n', '<space>m', ':Mason<Return>')

set('n', '<leader>ps', ':Lazy sync<Return>')

-- Find files using Telescope
--nnoremap <leader>ff <cmd>Telescope find_files<cr>
set('n', '<leader>ff', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>')
set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
set('n', '<leader>fp', '<cmd>Telescope projectionist<cr>')
-- Treesitter
set('n', '<leader>tsp', ':TSPlaygroundToggle<Return>')
set('n', '<leader>tsu', ':TSUpdate<Return>')

-- Fugitive git commands
-- changing prefix to g for git instead of fugitive since f clashes with find
-- or file
set('n', '<leader>gd', ':Gvdiff<Return>')
set('n', '<leader>gdu', ':diffupdate<Return>')
set('n', '<leader>gdg', ':diffget<Return>')
set('n', '<leader>gdp', ':diffput<Return>')
set('n', '<leader>gw', ':Gwrite<Return>')
set('n', '<leader>gwi', ':Gwrite!<Return>')
set('n', '<leader>gr', ':Gread<Return>')
set('n', '<leader>gb', ':Git blame<Return>')
set('n', '<leader>gs', ':Git<Return>')

-- mix format
set('n', '<leader>mf', ':!mix format %<Return>')

-- json pretty print
set('n', '<leader>jq', ':%!jq<Return>')

-- window commands
set('n', '<leader>%', ':vs<Return>')
set('n', '<leader>"', ':sp<Return>')
set('n', '<leader>o', ':only<Return>')

-- new tab
set('n', '<leader>tn', ':tabe<Return>')

-- pure laziness
set('n', '<leader>q', ':q<Return>')
set('n', '<leader>qa', ':qa<Return>')
set('n', '<leader>w', ':w<Return>')
set('n', '<leader>wq', ':wq<Return>')
set('n', '<leader>bd', ':bd<Return>')
