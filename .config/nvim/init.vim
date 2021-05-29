" =============================================================================
" Plugins
" =============================================================================
source $HOME/.config/nvim/autoload/plug.vim
call plug#begin('~/.config/nvim/autoload/plugged')
  " from the myth, the man, the legend
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-jdaddy'

  " tmux stuff
  Plug 'christoomey/vim-tmux-navigator'

  " have to sort through which of these should stay or go
  Plug 'editorconfig/editorconfig-vim'
  Plug 'dbakker/vim-projectroot'
  Plug 'Yggdroot/indentLine'
  Plug 'dense-analysis/ale'


  Plug 'freitass/todo.txt-vim'
  Plug 'plasticboy/vim-markdown'
  "Plug 'suan/vim-instant-markdown'
  Plug 'elixir-lang/vim-elixir'
  Plug 'mhinz/vim-mix-format'

  " new plugins after moving over
  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'nvim-lua/completion-nvim'
  Plug 'lewis6991/spellsitter.nvim'

  Plug 'jremmen/vim-ripgrep'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " appearance
  Plug 'rktjmp/lush.nvim'
  Plug 'npxbr/gruvbox.nvim'

  " status bar
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif
set background=dark " or light if you want light mode
colorscheme gruvbox

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

syntax on
set magic
set showmatch
set ai "auto indent
set expandtab " use spaces instead of tabs
set wrap
set number
set ic
set nobackup
set noswapfile

filetype plugin indent on
filetype indent on

let &colorcolumn=join(range(81,82),",")

set spelllang=en
set mouse=a
let g:auto_type_info=0

" remove trailing whitespace and blank lines with whitespace
autocmd BufWritePre * %s/\s\+$//e
" mix format on save
let g:mix_format_on_save = 1


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

let mapleader = " "
let maplocalleader = ","

" vim-plug commands
nnoremap <leader>pi :PlugInstall<Return>
nnoremap <leader>pu :PlugUpdate<Return>
nnoremap <leader>pd :PlugDiff<Return>
nnoremap <leader>pc :PlugClean<Return>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>:lua require('telescope.builtin').find_files{ find_command = {'rg', '--files', '--hidden', '-g', '!node_modules/**' , '-g', '!.git'} }<cr>
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Fugitive commands
nnoremap <leader>fd :Gvdiff<Return>
nnoremap <leader>fdu :diffupdate<Return>
nnoremap <leader>fdg :diffget<Return>
nnoremap <leader>fdp :diffput<Return>
nnoremap <leader>fw :Gwrite<Return>
nnoremap <leader>fwi :Gwrite!<Return>
nnoremap <leader>fr :Gread<Return>
nnoremap <leader>fb :Gblame<Return>
nnoremap <leader>fs :Gstatus<Return>

" window commands
nnoremap <leader>% :vs.<Return>
nnoremap <leader>" :sp.<Return>
nnoremap <leader>o :only<Return>

" new tab
nnoremap <leader>tn :tabe<Return>

nnoremap <leader>\ :ProjectRootExe :Rg --hidden<Space>
