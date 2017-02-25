set nocompatible		" be improved

" ----------------------------------------------
" Vundle initialization
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

call vundle#end()
filetype plugin indent on
" ----------------------------------------------

syntax enable
set background=dark
if has('gui_running')
    colorscheme solarized
endif

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

let mapleader=","

" ----------------------------------------------
"  Search options
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set formatoptions=qrn1
set colorcolumn=80

" ----------------------------------------------
"  Vim droppings management
set backup
set noswapfile
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" ----------------------------------------------
" Get rid of annoying help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

set pastetoggle=<F3>
nmap <F8> :TagbarToggle<CR>


" ----------------------------------------------
" Split window management
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ----------------------------------------------
" NERDTree
map <F12> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

