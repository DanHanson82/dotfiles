set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'burnettk/vim-angular'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'scrooloose/syntastic'
Bundle 'mbbill/undotree'
Bundle 'kien/ctrlp.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'dbakker/vim-projectroot'
Bundle 'rking/ag.vim'
Plugin 'bling/vim-airline'

Bundle 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

set encoding=utf-8
set mouse=a
set ttymouse=xterm2

" set colorcolumn=80
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


let g:pymode_folding = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

let mapleader = " "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Fugitive commands
nnoremap <leader>d :Gvdiff<Return>
nnoremap <leader>du :diffupdate<Return>
nnoremap <leader>w :Gwrite<Return>
nnoremap <leader>wi :Gwrite!<Return>
nnoremap <leader>r :Gread<Return>

nnoremap <leader>b :Gblame<Return>
nnoremap <leader>s :Gstatus<Return>

nnoremap <c-e> :Explore<Return>
nnoremap <leader>q :q<Return>
nnoremap <leader>qa :qa<Return>
nnoremap <leader>qi :qa!<Return>
nnoremap <leader>o :only<Return>
nnoremap <leader>\ :ProjectRootExe :Ag 
