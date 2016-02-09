set nocompatible
filetype off

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" load vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-repeat'
Plugin 'unblevable/quick-scope'
Plugin 'noahfrederick/vim-noctu'
Plugin 'tpope/vim-fugitive'
Plugin 'wellle/targets.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'leafo/moonscript-vim'

Plugin 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsSnippetsDir="~/.vim/snips"
let g:UltiSnipsSnippetDirectories=["snips"]
let g:UltiSnipsEditSplit="vertical"

Plugin 'zirrostig/vim-schlepp'
vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight
vmap D       <Plug>SchleppDup

call vundle#end()
filetype plugin indent on

" map leader to ,
let mapleader=","

syn on            " syntax highlighting
set rnu nu        " line nos
set showmatch     " show matching brackets
set shortmess+=I  " no startup msg

"set nowrap       " dont wrap lines
"set cursorcolumn " hilight cursor

colorscheme noctu
set background=dark
set listchars=trail:·

" fix s:last_* errors
set shell=/bin/bash

" undo history
set undofile
set undodir=~/.vim/undo
set noswapfile " fuck these

" wild menu
set wildmode=longest,list,full
set wildmenu
set wildignorecase

" default indent settings
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" hide everything powerline takes care of
set laststatus=2
set showtabline=2
set noshowmode

set mouse=a
set hidden
set hlsearch

" quicker buffer switching
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" disable arrows in command mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" put split windows right or below of current one
set splitbelow
set splitright

" show 80th col
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" blink line containing match
nnoremap <silent> n   n:call HLNext(0.3)<cr>
nnoremap <silent> N   N:call HLNext(0.3)<cr>

function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

" show special chars
exec "set listchars=tab:\u25B6\u2015,trail:\uB7,nbsp:~"
set list
