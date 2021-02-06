set nocompatible
set encoding=utf-8

set exrc
set hidden
set nowrap
set termguicolors
set scrolloff=8
set colorcolumn=80
set textwidth=80
set noshowmode
set completeopt=menuone,noinsert,noselect

set splitbelow
set splitright

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set smartcase
set ignorecase
set nohlsearch
set incsearch

set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

set cmdheight=1

set updatetime=50

set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

set path+=**
set wildmenu
set wildignorecase
set wildmode=longest:full,list,full
set wildignore=\*.git/\*
set wildignore+=\*node_modules/\*
set wildignore+=\*dist/\*
set wildignore+=\*out/\*
set wildignore+=\*.next/\*
set wildignore+=\*.coverage/\*

set clipboard=unnamed
