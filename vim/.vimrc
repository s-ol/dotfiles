" map leader to ,
let g:mapleader=','
let g:maplocalleader="\<Tab>"

"                                                                       plugins
"                                                           ┏━┓╻  ╻ ╻┏━╸╻┏┓╻┏━┓
"                                                           ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫┗━┓
"                                                           ╹  ┗━╸┗━┛┗━┛╹╹ ╹┗━┛
set nocompatible
filetype off

if has('python3')
  let g:powerline_pycmd = 'py3'
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
  python3 del powerline_setup
endif

call plug#begin('~/.vim/plugged')

" Language support
Plug 'glsl.vim'
Plug 'leafo/moonscript-vim'
Plug 'leafgarland/typescript-vim'
Plug 'bhurlow/vim-parinfer'


" Core extensions
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'


" Sign-column stuff
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'seletskiy/vim-refugi'
Plug 'noahfrederick/vim-noctu'

" Integrations
let g:ale_cpp_gcc_options = '-Isrc -std=c++14 -Wall'
" let g:ale_javascript_eslint_use_global = 1
" let g:ale_javascript_flow_use_global = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['eslint', 'tsserver'],
\ }
let g:ale_fixers = ['eslint']
nmap <silent> [f <Plug>(ale_previous_wrap)
nmap <silent> ]f <Plug>(ale_next_wrap)
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'

nmap <Leader>e :LmakeJob<CR>
nmap <Leader>E :MakeJob<CR>
nmap <Leader>c :lwindow<CR>
nmap <Leader>C :cwindow<CR>
"Plug 'djmoch/vim-makejob'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Plug 'scrooloose/syntastic'

" let g:ycm_server_python_interpreter='/usr/bin/python3'
" Plug 'Valloric/YouCompleteMe'

" let g:deoplete#enable_at_startup = 1
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:tidal_no_mappings = 1
Plug 'munshkr/vim-tidal'

let g:UltiSnipsExpandTrigger='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<c-l>'
let g:UltiSnipsJumpBackwardTrigger='<c-h>'
let g:UltiSnipsSnippetsDir='~/.vim/snips'
let g:UltiSnipsSnippetDirectories=['snips']
let g:UltiSnipsEditSplit='vertical'
Plug 'SirVer/ultisnips'

vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight
vmap D       <Plug>SchleppDup
Plug 'zirrostig/vim-schlepp'

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
Plug 'majutsushi/tagbar'


" nmap <Leader>r :NERDTreeToggle<CR>
" Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-vinegar'
augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft == 'qfix'
                \|     set nobuflisted
                \| endif
                \| if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif
augroup end



call plug#end()

"                                                                       general
"                                                         ┏━╸┏━╸┏┓╻┏━╸┏━┓┏━┓╻  
"                                                         ┃╺┓┣╸ ┃┗┫┣╸ ┣┳┛┣━┫┃  
"                                                         ┗━┛┗━╸╹ ╹┗━╸╹┗╸╹ ╹┗━╸

syn on            " syntax highlighting

set scrolloff=8
set iskeyword=@,48-57,192-255

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
set backspace=indent,eol,start

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

"set nowrap             " dont wrap lines
set mouse=a             " mouse input
set showmatch           " show matching brackets
set shortmess+=I        " no startup msg
set number
set relativenumber
set hlsearch incsearch
set clipboard=exclude:cons\|linux

" put split windows right or below of current one
set splitbelow
set splitright

" show 120th col
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%121v', 100)

augroup quickfix
au!
autocmd QuickFixCmdPost [^l]* nested cwindow | redraw!
autocmd QuickFixCmdPost    l* nested lwindow | redraw!
augroup END


"                                                                      bindings
"                                                          ┏┓ ╻┏┓╻╺┳┓╻┏┓╻┏━╸┏━┓
"                                                          ┣┻┓┃┃┗┫ ┃┃┃┃┗┫┃╺┓┗━┓
"                                                          ┗━┛╹╹ ╹╺┻┛╹╹ ╹┗━┛┗━┛

" disable hlsearch's matches
nnoremap <silent> <DEL> :nohl<CR>

" show shell
nnoremap <silent> <Leader><Space> :!<CR>

" switch buffers quickly
nnoremap <Leader><Tab> :b#<CR>
nnoremap <Leader><S-Tab> :ls<CR>:b<space>
nnoremap <Leader>q :b#\|bd#<CR>
nnoremap <Leader>l :lop<CR>
nnoremap ]q :bnext<CR>
nnoremap [q :bprev<CR>

" toggle paste
nnoremap <silent> <Leader>p :set paste!<CR>

" move down wrapped lines
noremap <expr> j (v:count? 'j' : 'gj')
noremap <expr> k (v:count? 'k' : 'gk')

" disable arrows in command mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" map :tabe to :e (fck tabs)
function! CommandCabbr(abbreviation, expansion)
  execute 'cabbr ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction
call CommandCabbr('tabe', 'e')

" remap @ in visual mode to apply macro to each line
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo '@'.getcmdline()
  execute ':"<,">normal @'.nr2char(getchar())
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
