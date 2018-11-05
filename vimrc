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
Plugin 'gregsexton/gitv'
Plugin 'yegappan/mru'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-classpath'
Plugin 'Chiel92/vim-autoformat'
Plugin 'luochen1990/rainbow'
Plugin 'flazz/vim-colorschemes'
"Plugin 'qualiabyte/vim-colorstepper'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/ZoomWin'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mtth/Scratch.vim'
Plugin 'chaoren/vim-wordmotion'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'calebsmith/vim-lambdify'
Plugin 'mileszs/ack.vim'

" JavaScript

"Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'clojure-vim/vim-cider'
Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/vim-salve'
Plugin 'venantius/vim-cljfmt'

"Elm
Plugin 'ElmCast/elm-vim'

" Makrdown
Plugin 'JamshedVesuna/vim-markdown-preview'


" Linux-only scripts
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux"
  Plugin 'Valloric/YouCompleteMe'
endif

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
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>

function! WrapOff()
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

function! WrapOn()
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

function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    call WrapOff()
  else
    echo "Wrap ON"
    call WrapOn()
  endif
endfunction
call WrapOn()

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC
augroup END " }


" mappings
"
" map <F8> mzgg=G`z
nnoremap <Leader>c :set cursorcolumn!<CR>


let g:rainbow_active = 1
let g:airline_theme = "molokai"
set statusline+=%*

let g:jsx_ext_required = 0

set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "passive_filetypes": ["html"] }

let g:formatterpath = ["/home/captain/.yarn/bin/"]

let powerline=$USE_POWERLINE_FONTS

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

let g:ackprg = 'ag --vimgrep'

if powerline == "true"
  let g:airline_powerline_fonts = 1
endif

" configure ALE
let g:ale_linters = {
      \   'javascript': ['standard'],
      \}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1

let g:ycm_semantic_triggers = { 'clojure' : [ '.', '/', '(' ] }

" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert

" set 'updatetime' to 15 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
au InsertLeave * let &updatetime=updaterestore

" set Nerdtree to open all the time 
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() != 0 || exists("s:std_in") | wincmd p | endif

set nu incsearch linebreak breakindent cursorline splitright splitbelow
set expandtab
set shiftwidth=2
set softtabstop=2
set laststatus=2
set backspace=2
set timeoutlen=1000 ttimeoutlen=10
set mouse=a
colorscheme devbox-dark-256
syntax on
set guifont=Droid\ Sans\ Mono
hi NonText ctermfg=bg
