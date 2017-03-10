set nocompatible              " be iMproved, required
filetype off                  " required
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish.git'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'scrooloose/syntastic'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'dbakker/vim-projectroot'
Bundle 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'


call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set mouse=a

set ttymouse=xterm2
let easytags_always_enabled=1
let easytags_async=1
let g:easytags_auto_update=1
let g:easytags_events = ['BufWritePost']
" Tell EasyTags to use the tags file found by Vim
" let g:easytags_dynamic_files = 1

set tags=~/.vimtags;

" autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
" autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
" autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4

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
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

syntax on
set magic
set showmatch
set ai "auto indent
set si "smart indent
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

" tagbar
nnoremap <leader>t :TagbarToggle<CR><Return>

" Fugitive commands
nnoremap <leader>d :Gvdiff<Return>
nnoremap <leader>du :diffupdate<Return>
nnoremap <leader>dg :diffget<Return>
nnoremap <leader>dp :diffput<Return>
nnoremap <leader>w :Gwrite<Return>
nnoremap <leader>wi :Gwrite!<Return>
nnoremap <leader>r :Gread<Return>

nnoremap <leader>b :Gblame<Return>
nnoremap <leader>s :Gstatus<Return>

nnoremap <leader>% :vs.<Return>
nnoremap <leader>" :sp.<Return>
nnoremap <leader>q :q<Return>
nnoremap <leader>qa :qa<Return>
nnoremap <leader>qi :qa!<Return>
nnoremap <leader>o :only<Return>
nnoremap <leader>\ :ProjectRootExe :Ag 
