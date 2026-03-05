" Neovim has its own config — don't load this there
if has('nvim') | finish | endif

let mapleader = "\\"

" Turn off vi compatibility settings like limited undo
set nocompatible
set encoding=utf-8

" UI
set number
set laststatus=2        " always show the statusline
set wildmenu            " better : tab completion
set scrolloff=5         " keep context lines above/below cursor
set splitright          " new vertical splits go right
set splitbelow          " new horizontal splits go below

" Editing
set backspace=indent,eol,start  " sane backspace in insert mode
set hidden                      " switch buffers without saving
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Search
set ignorecase          " case-insensitive search by default
set smartcase           " case-sensitive when pattern has uppercase
set hlsearch            " highlight search results
set incsearch           " incremental search
set magic               " extended regex

" Persistent undo
if has('persistent_undo')
  silent! call mkdir(expand('~/.vim/undo'), 'p')
  set undofile
  set undodir=~/.vim/undo
endif

" Syntax and filetype
syntax on
filetype plugin indent on

" Colorscheme
set background=dark
set termguicolors
try
  colorscheme solarized8
catch
  colorscheme default
endtry

" Markdown
let g:vim_markdown_folding_disabled = 1
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Have help open in a vertical split to the right
autocmd FileType help wincmd L
