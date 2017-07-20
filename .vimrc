colorscheme gruvbox
set nocompatible              " be iMproved, required
filetype off                  " required
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
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
Plugin 'python-mode/python-mode'
Plugin 'vim-ruby/vim-ruby'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'scrooloose/syntastic'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'dbakker/vim-projectroot'
Bundle 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'plasticboy/vim-markdown'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'suan/vim-instant-markdown'
Plugin 'freitass/todo.txt-vim'
Plugin 'Yggdroot/indentLine'
Bundle 'xolox/vim-misc'
" Bundle 'xolox/vim-easytags'
Plugin 'morhetz/gruvbox'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'benmills/vimux'

call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on    " required

set encoding=utf-8
set mouse=a
set t_Co=256

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

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
"
" remove trailing whitespace and blank lines with whitespace
autocmd BufWritePre * %s/\s\+$//e


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



let &colorcolumn=join(range(81,999),",")
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

" folding
set fdm=indent

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

let mapleader = " "
let maplocalleader = ","

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

" pomo timer commands
nnoremap <leader>pp :!thyme -d<CR><CR>
nnoremap <leader>ps :!thyme --stop<CR><CR>
nnoremap <leader>pb :!thyme -b -d<CR><CR>

" launch ag/silver searcher
nnoremap <leader>\ :ProjectRootExe :Ag --hidden<Space>
