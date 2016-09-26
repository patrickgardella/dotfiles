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

let g:solarized_termcolors=256
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
