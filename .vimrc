let mapleader = "\\"

call pathogen#infect()
call pathogen#helptags()

" Turn off vi compatibility settings like limited undo
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" Syntax highlighting based on file extension
syntax on
" Automatically insert newlines after 80 characters
" set textwidth=80
" Automatically indent
"set autoindent
filetype plugin indent on

set background=dark
colorscheme solarized

let vim_markdown_preview_hotkey='<C-m>'
source ~/.simplenoterc

augroup markdown
     au!
     au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Configure NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
