" INPUT ---------------------------- {{{
" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

"syntax highlight
syntax on

" line number
set number

" Set shift width to 4 spaces.
" set shiftwidth=4

" Set tab width to x columns.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
" set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
" set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
" set nowrap

" Ignore capital letters during search.
" set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
" set smartcase

" Show partial command you type in the last line of the screen.
" set showcmd

" Show the mode you are on the last line.
" set showmode

" Show matching brackets (???)
set showmatch

" Use highlighting when doing a search.
set incsearch
set hlsearch

" Set the commands to save in history default number is 20.
" set history=1000

" autocomplete
set wildmenu

" Fold code blocks | with more than x lines | with x key
set foldenable
set foldlevelstart=20
nnoremap <space> za



" }}}





" PLUGINS ------------------------------ {{{
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdcommenter'
Plug 'kyoz/purify', { 'rtp': 'vim' }
"Plug 'ycm-core/YouCompleteMe '
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'


call plug#end()

" }}}





" THEMES -------------------------- {{{
colorscheme default


"}}}





" STATUS BAR --------------------- {{{

hi User1 guifg=#EEEEEE guibg=#222222
hi User2 guifg=#000000 guibg=#FFFFFF


" Clear status line when vimrc is reloaded.
" set statusline=

" row/col percent
set statusline=\ linha\ %l\/%L
set statusline+=\.%c
set statusline+=\ %p%%
set statusline+=\ \ඞ

" Use a divider to separate the left side from the right side.
set statusline+=%=

" flag readyonly
set statusline+=%2*%r%\*
" caminho arquivo 
set statusline+=\ %F
" flag modificado
set statusline+=\ %2*%m\%*
" Tipo arquivo
set statusline+=\ %Y\ 

"set fillchars=stl:ඞ
function StatusLine()
    let left = '\ linha\ %l\/%L\.%c\ %p%%'
    let right = '%2*%r%\*\ %F\ %2*%m\%*'

    let spacer_width = winwidth(0) - len(left) - len(right)
    let spacer = repeat('ඞ', spacer_width)

    return left . spacer . right
endfunction


"set statusline=%{StatusLine()}



" Show the status on the second to last line.
set laststatus=2

" }}}

