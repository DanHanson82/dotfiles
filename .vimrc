if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

" have to run git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
" debating if I use another package manager but seems to work for now
packadd minpac

call minpac#init()

call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-sleuth')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-vinegar')
call minpac#add('tpope/vim-jdaddy')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('dbakker/vim-projectroot')
call minpac#add('w0rp/ale')
call minpac#add('bling/vim-airline')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('elixir-lang/vim-elixir')
call minpac#add('mhinz/vim-mix-format')
call minpac#add('catppuccin/vim')
call minpac#add('ryanoasis/vim-devicons')

let g:airline_theme = 'catppuccin_mocha'
colorscheme catppuccin_mocha

filetype plugin indent on    " required
filetype indent on    " required

set encoding=utf-8
set mouse=a
set t_Co=256

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Send more characters for redraws
set ttyfast
set ttymouse=xterm2

let g:auto_type_info=0

" autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
"
" remove trailing whitespace and blank lines with whitespace
autocmd BufWritePre * %s/\s\+$//e

" mix format on save
let g:mix_format_on_save = 1


let &colorcolumn=join(range(81,82),",")

let g:VimuxOrientation = "h"

syntax on
set magic
set showmatch
set ai "auto indent
set expandtab " use spaces instead of tabs
set wrap
set number
set relativenumber
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
nnoremap <leader>ps :call minpac#update()<Return>
nnoremap <leader>pc :call minpac#clean()<Return>

" Fugitive commands
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

nnoremap <leader>q :q<Return>
nnoremap <leader>qa :qa<Return>
nnoremap <leader>w :w<Return>
nnoremap <leader>wq :wq<Return>
nnoremap <leader>bd :bd<Return>

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
