set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-repeat.git'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'dbakker/vim-projectroot'
Bundle 'rking/ag.vim'
Plugin 'bling/vim-airline'

if !has('nvim')
        Plugin 'xolox/vim-misc'
        Plugin 'xolox/vim-easytags'
endif

call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set mouse=a

if !has('nvim')
        set ttymouse=xterm2
        let easytags_always_enabled=1
        let easytags_async=1
endif


let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

set magic
set showmatch
set ai "auto indent
set si "smart indent
set expandtab " use spaces instead of tabs
set wrap
set number
set ic
syntax on
set nobackup
set noswapfile

" statusline
set laststatus=2
set backspace=indent,eol,start

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

let mapleader = " "

" Fugitive commands
nnoremap <leader>d :Gvdiff<Return>
nnoremap <leader>du :diffupdate<Return>
nnoremap <leader>w :Gwrite<Return>
nnoremap <leader>wi :Gwrite!<Return>
nnoremap <leader>r :Gread<Return>

nnoremap <leader>b :Gblame<Return>
nnoremap <leader>s :Gstatus<Return>

nnoremap <c-e> :Explore<Return>
nnoremap <leader>% :vs.<Return>
nnoremap <leader>" :sp.<Return>
nnoremap <leader>q :q<Return>
nnoremap <leader>qa :qa<Return>
nnoremap <leader>qi :qa!<Return>
nnoremap <leader>o :only<Return>
nnoremap <leader>\ :ProjectRootExe :Ag 
