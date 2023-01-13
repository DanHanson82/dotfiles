------------------------------------------------------------
-- Keyboard Mappings
------------------------------------------------------------

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local set = vim.keymap.set

-- lsp
vim.keymap.set('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', '<leader>lf', '<cmd>:lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<leader>lh ', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- method textDocument/rename is not supported by any of the servers registered for the current buffer
vim.keymap.set('n', '<silent>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- trouble
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>')
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
-- nnoremap gR <cmd>TroubleToggle lsp_references<cr>

-- packer commands
vim.keymap.set('n', '<leader>pi', ':PackerInstall<Return>')
vim.keymap.set('n', '<leader>pu', ':PackerUpdate<Return>')
vim.keymap.set('n', '<leader>ps', ':PackerSync<Return>')
vim.keymap.set('n', '<leader>pc', ':PackerClean<Return>')

-- Find files using Telescope
--nnoremap <leader>ff <cmd>Telescope find_files<cr>
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- Treesitter
vim.keymap.set('n', '<leader>tsp', ':TSPlaygroundToggle<Return>')

-- Fugitive git commands
-- changing prefix to g for git instead of fugitive since f clashes with find
-- or file
vim.keymap.set('n', '<leader>gd', ':Gvdiff<Return>')
vim.keymap.set('n', '<leader>gdu', ':diffupdate<Return>')
vim.keymap.set('n', '<leader>gdg', ':diffget<Return>')
vim.keymap.set('n', '<leader>gdp', ':diffput<Return>')
vim.keymap.set('n', '<leader>gw', ':Gwrite<Return>')
vim.keymap.set('n', '<leader>gwi', ':Gwrite!<Return>')
vim.keymap.set('n', '<leader>gr', ':Gread<Return>')
vim.keymap.set('n', '<leader>gb', ':Git blame<Return>')
vim.keymap.set('n', '<leader>gs', ':Git<Return>')

-- mix format
vim.keymap.set('n', '<leader>mf', ':MixFormat<Return>')

-- json pretty print
vim.keymap.set('n', '<leader>jq', ':%!jq<Return>')

-- window commands
vim.keymap.set('n', '<leader>%', ':vs.<Return>')
vim.keymap.set('n', '<leader>"', ':sp.<Return>')
vim.keymap.set('n', '<leader>o', ':only<Return>')

-- new tab
vim.keymap.set('n', '<leader>tn', ':tabe<Return>')

-- pure laziness
vim.keymap.set('n', '<leader>q', ':q<Return>')
vim.keymap.set('n', '<leader>qa', ':qa<Return>')
vim.keymap.set('n', '<leader>w', ':w<Return>')
vim.keymap.set('n', '<leader>wq', ':wq<Return>')
