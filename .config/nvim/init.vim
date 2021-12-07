" =============================================================================
" Plugins
" =============================================================================
source $HOME/.config/nvim/autoload/plug.vim
call plug#begin('~/.config/nvim/autoload/plugged')
  " from the myth, the man, the legend
  " git plugin so awesome it should be illegal
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-jdaddy'

  Plug 'christoomey/vim-tmux-navigator'
  Plug 'dbakker/vim-projectroot'
  Plug 'freitass/todo.txt-vim'
  Plug 'plasticboy/vim-markdown'
  "Plug 'suan/vim-instant-markdown'
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'
  Plug 'editorconfig/editorconfig-vim'

  " tree-sitter
  " install rust and then run the following to install a working version of tree-sitter-cli
  " cargo install tree-sitter-cli --git https://github.com/tree-sitter/tree-sitter.git --tag v0.19.5
  " TODO: figure out a way of handling various formatters in my dotfiles
  " TSInstall elixir
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " for using treesitter playground
  " :TSInstall query
  Plug 'nvim-treesitter/playground'
  Plug 'lewis6991/spellsitter.nvim'

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  " ex: LspInstall elixir
  Plug 'nvim-lua/completion-nvim'

  " telescope, fuzzy file finding and live grepping
  Plug 'BurntSushi/ripgrep'
  "Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }


  " appearance
  Plug 'marko-cerovac/material.nvim'
  Plug 'Yggdroot/indentLine'

  " status bar
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'

  Plug 'famiu/nvim-reload'
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif
set background=dark " or light if you want light mode
colorscheme material
let g:material_style = 'darker'

" =============================================================================
" tree-sitter
" =============================================================================

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
      },
  indent = {
          enable = true
      },
  query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = {"BufWrite", "CursorHold"},
    },
}
EOF

" =============================================================================
" Lightline
" https://github.com/itchyny/lightline.vim
" =============================================================================
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }


" =============================================================================
" lsp installer
" https://github.com/williamboman/nvim-lsp-installer
" =============================================================================

lua <<EOF
local lsp_installer_servers = require'nvim-lsp-installer.servers'

local server_available, requested_server = lsp_installer_servers.get_server("rust_analyzer")
if server_available then
    requested_server:on_ready(function ()
        local opts = {}
        requested_server:setup(opts)
    end)
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
    end
end
EOF

" =============================================================================
" lsp config
" =============================================================================

" =============================================================================
" telescope
" =============================================================================

lua <<EOF
require('telescope').load_extension('fzf')
EOF

" =============================================================================
" telescope
" =============================================================================

syntax on
set magic
set showmatch
set ai "auto indent
set expandtab " use spaces instead of tabs. TODO: see how to handle tsv files
set wrap
set number
set ic
set nobackup
set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
filetype plugin indent on
filetype indent on
set spelllang=en
set mouse=a
let g:auto_type_info=0

" add a line at 80 characters
let &colorcolumn=join(range(81,82),",")


" =============================================================================
" on save file
" =============================================================================

" remove trailing whitespace and blank lines with whitespace
autocmd BufWritePre * %s/\s\+$//e

" mix format on save
let g:mix_format_on_save = 1

" commenting this out for now
"autocmd BufWritePre <buffer> call Preserve('lua vim.lsp.buf.formatting_sync(nil, 1000)')


" =============================================================================
" custom key mappings
" =============================================================================

let mapleader = " "
let maplocalleader = ","

" lsp
"
nnoremap <leader>lt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>lf <cmd>:lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>lh  <cmd>lua vim.lsp.buf.hover()<CR>
" method textDocument/rename is not supported by any of the servers registered for the current buffer
nnoremap <silent>rn <cmd>lua vim.lsp.buf.rename()<CR>

" vim-plug commands
nnoremap <leader>pi :PlugInstall<Return>
nnoremap <leader>pu :PlugUpdate<Return>
nnoremap <leader>pd :PlugDiff<Return>
nnoremap <leader>pc :PlugClean<Return>

" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>:lua require('telescope.builtin').find_files{ find_command = {'rg', '--files', '--hidden', '-g', '!node_modules/**' , '-g', '!.git'} }<cr>
"nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Treesitter
nnoremap <leader>tsp :TSPlaygroundToggle<Return>

" Fugitive git commands
" changing prefix to g for git instead of fugitive since f clashes with find
" or file
nnoremap <leader>gd :Gvdiff<Return>
nnoremap <leader>gdu :diffupdate<Return>
nnoremap <leader>gdg :diffget<Return>
nnoremap <leader>gdp :diffput<Return>
nnoremap <leader>gw :Gwrite<Return>
nnoremap <leader>gwi :Gwrite!<Return>
nnoremap <leader>gr :Gread<Return>
nnoremap <leader>gb :Git blame<Return>
nnoremap <leader>gs :Git<Return>

" window commands
nnoremap <leader>% :vs.<Return>
nnoremap <leader>" :sp.<Return>
nnoremap <leader>o :only<Return>

" new tab
nnoremap <leader>tn :tabe<Return>

" pure laziness
nnoremap <leader>q :q<Return>
nnoremap <leader>qa :qa<Return>
nnoremap <leader>w :w<Return>
nnoremap <leader>wq :wq<Return>
