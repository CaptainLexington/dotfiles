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
Plugin 'mhinz/vim-startify'
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'yegappan/mru'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-classpath'
Plugin 'AndrewRadev/bufferize.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'luochen1990/rainbow'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/ZoomWin'
Plugin 'mtth/Scratch.vim'
Plugin 'chaoren/vim-wordmotion'
Plugin 'junegunn/vim-easy-align'
Plugin 'w0rp/ale'
Plugin 'calebsmith/vim-lambdify'
Plugin 'brooth/far.vim'
Plugin 'mileszs/ack.vim'
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'
Plugin 'ajh17/VimCompletesMe'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" Plugin 'TaDaa/vimade'

" Colorschemes
Plugin 'flazz/vim-colorschemes'
"Plugin 'qualiabyte/vim-colorstepper'
Plugin 'morhetz/gruvbox'

" JavaScript
"Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-highlight'
Plugin 'clojure-vim/vim-cider'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-salve'
Plugin 'venantius/vim-cljfmt'

" Carp
Plugin 'hellerve/carp-vim'

"Elm
Plugin 'ElmCast/elm-vim'

" English Writing
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
"Plugin 'vim-scripts/fountain.vim'
Plugin 'vim-scripts/voom'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'



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

augroup filetypedetect
  autocmd BufNew,BufNewFile,BufRead *.carp :setfiletype lisp
augroup END


" mappings
"
" map <F8> mzgg=G`z
nnoremap <Leader>c :set cursorcolumn!<CR>


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use vim-easy-align to align Clojure maps
nnoremap <Leader>m va{ :'<,'>EasyAlign \ <CR>

let g:rainbow_active = 1
let g:airline_theme = "gruvbox"

let g:sexp_no_word_maps = 1

let g:jsx_ext_required = 0

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
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 500
let g:ale_lint_on_insert_leave = 1
let g:ale_list_window_size = 10


" configure VimCompletesMe
set omnifunc=syntaxcomplete#Complete
let g:vcm_omni_pattern='\k\+\(\.\|->\|::\|\/\)\k*$'

" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert

" set 'updatetime' to 15 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
au InsertLeave * let &updatetime=updaterestore

" set leader keymapping for Goyo/Limelight
noremap <silent> <Leader>g :Goyo<CR>
" set background-color for Limelight
let g:limelight_conceal_ctermfg = 'DarkGray'

let g:airline_symbols_ascii = 1

set nu incsearch linebreak breakindent cursorline splitright splitbelow relativenumber
set expandtab
set shiftwidth=2
set softtabstop=2
set laststatus=2
set backspace=2
set timeoutlen=1000 ttimeoutlen=10
set mouse=a
set background=dark
colorscheme gruvbox
syntax on
set guifont=Droid\ Sans\ Mono
hi NonText ctermfg=bg
hi error ctermbg=DarkYellow
hi error ctermfg=Yellow
hi SpellBad ctermbg=DarkYellow
