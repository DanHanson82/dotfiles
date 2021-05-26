set nocompatible              " be iMproved, required
filetype off                  " required
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME

if (has("termguicolors"))
  set termguicolors
endif

" =============================================================================
" Plugins
" =============================================================================
"source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/autoload/plug.vim
" call plug#begin()
call plug#begin('~/.config/nvim/autoload/plugged')
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
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'dbakker/vim-projectroot'
  Plug 'rking/ag.vim'
  Plug 'w0rp/ale'
  Plug 'bling/vim-airline'
  Plug 'plasticboy/vim-markdown'
  Plug 'suan/vim-instant-markdown'
  Plug 'freitass/todo.txt-vim'
  Plug 'Yggdroot/indentLine'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'elixir-lang/vim-elixir'
  Plug 'mhinz/vim-mix-format'
  Plug 'benmills/vimux'
  Plug 'overcache/NeoSolarized'
call plug#end()

colorscheme NeoSolarized

filetype plugin indent on    " required
filetype indent on    " required

set encoding=utf-8
set mouse=a
set t_Co=256

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

let g:auto_type_info=0

" autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
" autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
" autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4
"
" remove trailing whitespace and blank lines with whitespace
autocmd BufWritePre * %s/\s\+$//e

" mix format on save
let g:mix_format_on_save = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Speedup ctrlp search in large projects
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'



let &colorcolumn=join(range(81,82),",")

let g:VimuxOrientation = "h"

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

" statusline
set laststatus=2
set backspace=indent,eol,start

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

let mapleader = " "
let maplocalleader = ","

" minpac commands
nnoremap <leader>mu :call minpac#update()<Return>
nnoremap <leader>mc :call minpac#clean()<Return>

" vim-plug commands
nnoremap <leader>pi :PlugInstall<Return>
nnoremap <leader>pu :PlugUpdate<Return>
nnoremap <leader>pd :PlugDiff<Return>
nnoremap <leader>pc :PlugClean<Return>

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

" vimux commands
nnoremap <leader>to :ProjectRootExe :call VimuxOpenPane()<CR>
nnoremap <leader>tc :ProjectRootExe :call VimuxSendKeys("C-c")<CR>
nnoremap <leader>td :ProjectRootExe :call VimuxSendKeys("C-d")<CR>
nnoremap <leader>tr :ProjectRootExe :call VimuxPromptCommand("")<CR>
nnoremap <leader>dc :ProjectRootExe :call VimuxPromptCommand("docker-compose ")<CR>
nnoremap <leader>dcr :ProjectRootExe :call VimuxPromptCommand("docker-compose run test ")<CR>
nnoremap <leader>dcu :ProjectRootExe :call VimuxPromptCommand("docker-compose up ")<CR>
nnoremap <leader>dcd :ProjectRootExe :call VimuxPromptCommand("docker-compose down ")<CR>
nnoremap <leader>dcs :ProjectRootExe :call VimuxPromptCommand("docker-compose stop ")<CR>

 map <Leader>vl :VimuxRunLastCommand<CR>

" window commands
nnoremap <leader>% :vs.<Return>
nnoremap <leader>" :sp.<Return>
nnoremap <leader>o :only<Return>

" new tab
nnoremap <leader>tn :tabe<Return>

" launch ag/silver searcher
nnoremap <leader>\ :ProjectRootExe :Ag --hidden<Space>

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
