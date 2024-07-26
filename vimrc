let mapleader = "\\"

" Turn off vi compatibility settings like limited undo
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set shiftwidth=4   " Allow for indents to be four columns

" Syntax highlighting based on file extension
syntax on
" Automatically insert newlines after 80 characters
" set textwidth=80
" Automatically indent
"set autoindent

filetype plugin indent on

"Have help open in a split to the right, rather than vertically
autocmd FileType help wincmd L

"Configure theme
"let g:solarized_termcolors=256
"colorscheme solarized
set background=dark
set termguicolors
colorscheme solarized8

let g:vim_markdown_folding_disabled = 1

autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Improve search
set ignorecase                  " To ignore case when searching.
set smartcase                   " When searching try to be smart about cases.
set hlsearch                    " To highlight search results.
set incsearch                   " To make search act like search in modern browsers.
set magic                       " For regular expressions turn magic on.
