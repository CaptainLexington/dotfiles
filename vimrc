set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" General scripts
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'luochen1990/rainbow'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'qualiabyte/vim-colorstepper'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/ZoomWin'

" JavaScript

Plugin 'vim-scripts/JavaScript-Indent'

" Clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/vim-salve' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Use arrow keys to navigate visible (wrapped) instead of logical lines:
noremap <silent> <Leader>w :call ToggleWrap()<CR>

function WrapOff()
	setlocal nowrap
	set virtualedit=all
	silent! nunmap <buffer> <Up>
	silent! nunmap <buffer> <Down>
	silent! nunmap <buffer> <Home>
	silent! nunmap <buffer> <End>
	silent! iunmap <buffer> <Up>
	silent! iunmap <buffer> <Down>
	silent! iunmap <buffer> <Home>
	silent! iunmap <buffer> <End>
endfunction

function WrapOn()
	setlocal wrap linebreak nolist
	set virtualedit=
	setlocal display+=lastline
	noremap  <buffer> <silent> <Up>   gk
	noremap  <buffer> <silent> <Down> gj
	noremap  <buffer> <silent> <Home> g<Home>
	noremap  <buffer> <silent> <End>  g<End>
	inoremap <buffer> <silent> <Up>   <C-o>gk
	inoremap <buffer> <silent> <Down> <C-o>gj
	inoremap <buffer> <silent> <Home> <C-o>g<Home>
	inoremap <buffer> <silent> <End>  <C-o>g<End>
endfunction

function ToggleWrap()
	if &wrap
		echo "Wrap OFF"
		call WrapOff()    
	else
		echo "Wrap ON"
		call WrapOn()
	endif
endfunction
call WrapOn()


" mappings
"
map <F8> mzgg=G`z

let g:rainbow_active = 1
" associate *.foo with php filetype
au BufRead,BufNewFile *.dust setfiletype html

set nu incsearch breakindent linebreak cursorline
set laststatus=2
set backspace=2
colorscheme devbox-dark-256
syntax on
set guifont=Droid\ Sans\ Mono
