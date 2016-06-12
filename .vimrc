runtime bundle/vim-pathogen/autoload/pathogen.vim

" remove . from backup directory list
set backupdir-=.
" append new directories to list
set backupdir^=~/.vim/bak

set term=xterm
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
" Enable 256 colors
set t_Co=256
" Using the Tomorrow-Night-Eighties colorscheme
colorscheme Tomorrow-Night-Eighties

" set the guifont
if has('gui_running')
    set guifont=Consolas:h9
endif

" from http://dougblack.io/words/a-good-vimrc.html
" enable syntax processing
syntax enable

" avoid using \t in files:
" $tabstop is how many spaces a \t appears as
" $softtabstop is how many spaces are inserted/removed by tabbing and backspacing over tabs
" $shiftwidth seems to be necessary to prevent double tabbing on <Enter>
" $expandtab replaces \t in realtime with spaces as inserted
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" automatically indent to current level
set autoindent
set smartindent

" enable line numbering
set number
" highlight current line
set cursorline
" visual autocomplete interface
set wildmenu
" disable vim's automatic redrawing
set lazyredraw

" instant/live search as chars typed in
set incsearch
" highlight matches
set hlsearch

" execute pathogen#infect()
" syntax on
" filetype plugin indent on
call pathogen#infect()
call pathogen#helptags()

" disable scratch/preview in jedi
set completeopt-=preview

" make tab completion go in the forward direction
let g:SuperTabDefaultCompletionType = "<c-n>"

" automatic folding
set foldmethod=indent
set foldnestmax=2

" remap tabbing
cnoreabbrev <expr> te getcmdtype() == ":" && getcmdline() == 'te' ? 'tabedit' : 'te'
cnoreabbrev <expr> tq getcmdtype() == ":" && getcmdline() == 'tq' ? 'tabclose' : 'tq'

