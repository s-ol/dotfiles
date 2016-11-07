" map leader to ,
let mapleader=","
let maplocalleader="\<Tab>"

"                                                                       plugins
"                                                           ┏━┓╻  ╻ ╻┏━╸╻┏┓╻┏━┓
"                                                           ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫┗━┓
"                                                           ╹  ┗━╸┗━┛┗━┛╹╹ ╹┗━┛
set nocompatible
filetype off

let g:powerline_pycmd = "py3"
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" load vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-repeat'
Plugin 'noahfrederick/vim-noctu'
Plugin 'tpope/vim-fugitive'
Plugin 'wellle/targets.vim'
Plugin 'leafo/moonscript-vim'
Plugin 'kshenoy/vim-signature'
Plugin 'davisdude/vim-love-docs'
Plugin 's-ol/ale'
" Plugin 'vim-scripts/Smart-Tabs'

let g:ycm_server_python_interpreter='/usr/bin/python3'
"Plugin 'Valloric/YouCompleteMe'

Plugin 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

Plugin 'munshkr/vim-tidal'
let g:tidal_no_mappings = 1

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

Plugin 'majutsushi/tagbar'
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_type_moon = {
    \ 'ctagstype' : 'moonscript',
    \ 'kinds'     : [
        \ 'v:variables',
        \ 'f:functions',
        \ 'c:classes',
        \ 'm:methods',
        \ 's:static properties',
        \ 'p:properties',
    \ ]
\ }

call vundle#end()
filetype plugin indent on

"                                                                       general
"                                                         ┏━╸┏━╸┏┓╻┏━╸┏━┓┏━┓╻  
"                                                         ┃╺┓┣╸ ┃┗┫┣╸ ┣┳┛┣━┫┃  
"                                                         ┗━┛┗━╸╹ ╹┗━╸╹┗╸╹ ╹┗━╸

syn on            " syntax highlighting
set hidden        " allow leaving buffers

set scrolloff=8

" fix s:last_* errors
set shell=/bin/bash

" undo history
set undofile
set undodir=~/.vim/undo
set noswapfile " fuck these

" wild menu
set wildmode=longest,list,full
set wildmenu
set nowildignorecase

" default indent settings
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

"                                                                        visual
"                                                              ╻ ╻╻┏━┓╻ ╻┏━┓╻  
"                                                              ┃┏┛┃┗━┓┃ ┃┣━┫┃  
"                                                              ┗┛ ╹┗━┛┗━┛╹ ╹┗━╸

" colorscheme
colorscheme noctu
set background=dark

" hide everything powerline takes care of
set laststatus=2
set showtabline=2
set noshowmode

"set nowrap       " dont wrap lines
set mouse=a       " mouse input
set rnu nu        " line nos
set showmatch     " show matching brackets
set shortmess+=I  " no startup msg
set hlsearch incsearch " hilight search

" put split windows right or below of current one
set splitbelow
set splitright

" show 80th col
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


"                                                                      bindings
"                                                          ┏┓ ╻┏┓╻╺┳┓╻┏┓╻┏━╸┏━┓
"                                                          ┣┻┓┃┃┗┫ ┃┃┃┃┗┫┃╺┓┗━┓
"                                                          ┗━┛╹╹ ╹╺┻┛╹╹ ╹┗━┛┗━┛

" disable hlsearch's matches
nnoremap <silent> <DEL> :nohl<CR>

" show shell
nnoremap <silent> <Leader><Space> :!<CR>

" switch buffers quickly
nnoremap <Leader><Tab> :bn<CR>
nnoremap <Leader><S-Tab> :bp<CR>
nnoremap <Leader>q :b#\|bd#<CR>

" toggle paste
nnoremap <silent> <Leader>p :set paste!<CR>

" quicker buffer switching
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" move down wrapped lines
noremap <expr> j (v:count? 'j' : 'gj')
noremap <expr> k (v:count? 'k' : 'gk')

" disable arrows in command mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

function! CommandCabbr(abbreviation, expansion)
  execute 'cabbr ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction
call CommandCabbr("tabe", "e")

" remap @ in visual mode to apply macro to each line
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" blink line containing match
" nnoremap <silent> n   n:call HLNext(0.3)<cr>
" nnoremap <silent> N   N:call HLNext(0.3)<cr>

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

" <Leader>e and <Leader>r to run in vim shell and tmux
function! s:PromptCommand()
  if !exists("s:user_command")
    let s:user_command = ""
  endif
  echohl String | let s:user_command = input("run: ", s:user_command) | echohl None
endfunction

function! RunTmuxCommand(redefine)
  if !exists("s:user_command") || a:redefine == 1
     call s:PromptCommand()
  endif
  let command = "tmux send " . shellescape(s:user_command) . " Enter"
  return system(command)
endfunction

function! RunShell(redefine)
  if !exists("s:user_command") || a:redefine == 1
    call s:PromptCommand()
  endif
  exec "!" . s:user_command
endfunction

command! RunTmux  call RunTmuxCommand(0)
command! RuNTmux  call RunTmuxCommand(1)
command! RunShell call RunShell(0)
command! RuNShell call RunShell(1)

nmap <Leader>r :RunTmux<CR>
nmap <Leader>R :RuNTmux<CR>
nmap <Leader>e :RunShell<CR>
nmap <Leader>E :RuNShell<CR>
