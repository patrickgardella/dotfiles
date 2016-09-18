call pathogen#infect()
call pathogen#helptags()

" Turn off vi compatibility settings like limited undo
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" " Syntax highlighting based on file extension
syntax on
" " Automatically insert newlines after 80 characters
" set textwidth=80
" " Automatically indent
"set autoindent
filetype plugin indent on

set background=light
colorscheme solarized

let vim_markdown_preview_hotkey='<C-m>'
