" vim:fdm=marker
execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible

if has('gui_running')
    if has("win32")
        " set guifont=Inconsolata:h10
        " set guifont=Consolas:h10
        set guifont=DejaVu\ Sans\ Mono:h8
        source $VIMRUNTIME/mswin.vim
        behave mswin
    else
        set guifont=DejaVu\ Sans\ Mono\ Book\ 8
    endif

    set guioptions -=T          " Hide the toolbar
    set lines=100 columns =100  " Initial window size
endif

""" REMAPS
noremap ; :
map <space> <leader>
inoremap jj <ESC>


" quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

"-- Spaces and tabs
set tabstop=4		" number of visual spaces per tab
set softtabstop=4	" number of spaces in tab when editting
set shiftwidth=4
set expandtab		" tabs as spaces

" Temp files
if !isdirectory($HOME."/Documents/_vimtemp")
    call mkdir($HOME."/Documents/_vimtemp", "p")
endif
set backupdir=$HOME/Documents/_vimtemp//
set directory=$HOME/Documents/_vimtemp//

"-- UI config
set encoding=utf-8  " encoding
set number			" show line numbers
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set hidden          " hidden buffers
set showmatch       " highlight matching [{()}]
set t_Co=256        " Colors
set background=dark " dark background
if has ('gui_running')
    " colorscheme mushroom
    " colorscheme flatlandia
    colorscheme solarized
else
    colorscheme iceberg  
endif


"-- Search
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set ignorecase      " case-sensitive search intelligently
set smartcase       " 
" normal regex
nnoremap / /\v
vnoremap / /\v
" turn off highlight
nnoremap <leader><space> :nohlsearch<CR>
" move along brackets
nnoremap <tab> %
vnoremap <tab> %

" MOVEMENT {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to the beginning/end of line
"nnoremap B ^
"nnoremap E $
" bubble single lines
nmap <up>   [e
nmap <down> ]e
" bubble multiple lines
vmap <up>   [egv
vmap <down> ]egv
" move lines horizontally
nmap <left>  <<
nmap <right> >>
vmap <left>  <'[V']
vmap <right> >'[V']
" window-movements
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" window split
nmap <leader>s :split<CR>
imap <leader>s :split<CR>
nmap <leader>v :vsplit<CR>
imap <leader>v :vsplit<CR>
" buffer movement
map <C-PageDown>    :bnext<CR>
map <C-PageUp>  :bprev<CR>
map <leader>l   :bnext<CR>
map <leader>h   :bprev<CR>
map <leader>x   :bd<CR>
" }}}

" MISC {{{ 
autocmd BufNewFile,BufReadPost *.md set filetype=markdown   " .md files as markdown
" get current path
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
" edit file in current window, h-split, v-split, tab
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" }}}

" PLUGINS {{{
" - Airline {{{
" -- UI
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V-L',
      \ '' : 'V-B',
      \ 's'  : 'S',
      \ 'S'  : 'S-L',
      \ }
" let g:airline_theme = 'powerlineish'
" let g:airline_theme = 'sol'
" let g:airline_theme = 'tomorrow'
" let g:airline_theme = 'base16'
let g:airline_theme = 'airlineish'
let g:airline#extension#syntatic#enabled = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
" -- Buffers
let g:airline#extensions#tabline#enabled = 1        " enable buffers
let g:airline#extensions#tabline#left_sep = ' '     " 
let g:airline#extensions#tabline#left_alt_sep = '|' " 
let g:airline#extensions#tabline#fnamemod = ':t'    " show only names
" -- Symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '❯'    " Left separator
let g:airline_right_sep = '❮'   " Right separator
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
"   }}}
" - Indent Line {{{ 
let g:indentLine_char = '┆'
let g:indentLine_color_term = 236
let g:indentLine_color_gui = '#303030'
"   }}}
" - CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_working_path_mode = 0   " Search from current file
"   }}}
" - NERDTree {{{
:nmap <leader>b :NERDTreeToggle<CR>
"   }}}
" - Vim Notes {{{
let g:notes_directories = ["~/Documents/Notes"]
let g:notes_suffix = '.txt'
"   }}}
" - Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"   }}}
" - GitGutter {{{
let g:gitgutter_enabled = 0
nnoremap <leader>g :GitGutterToggle<CR>
"   }}}
" }}}
