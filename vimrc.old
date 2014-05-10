"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Mike Redd a lazy sob.
"             http://m-redd.com
"
" Version: 1.0 - 01/14/12 23:10:58
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""
" runtime path
"set runtimepath+=/usr/share/vim
set runtimepath+=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

" I do not like the vi-compatible mode.
set nocompatible 

" Make backspace work as usual.
set backspace=indent,eol,start

" Allow changing the buffer without saving.
set hidden 

" Do not place the cursor at the start of the line when using Page up/down.
set nostartofline

set nrformats=alpha,hex

" Allow the cursor to be positioned where there is no actual character.
" Visual block mode only.
set virtualedit=block

""""""""""""""""""""""
" insert the current datestamp
"""""""""""""""""""""""
:nnoremap <F5> "=strftime("Last Modified: %b %d, %X (%Z)")<CR>P
:inoremap <F5> <C-R>=strftime("Last Modified: %b %d, %X (%Z)")<CR>

""""""""""""""""""""""""
" 256 Color help when on other systems
""""""""""""""""""""""""
if &term =~# '^\(screen\|rxvt-unicode-256color\|xterm-256color\)$'
    set t_Co=256
endif

""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
""""""""""""""""""""""""
set history=1000

""""""""""""""""""""""""
" Enable filetype plugin
""""""""""""""""""""""""
filetype plugin on
filetype indent on

" Support all three, in this order
set fileformats=unix,dos,mac

""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
""""""""""""""""""""""""
set autoread

""""""""""""""""""""""""
" Backup files
""""""""""""""""""""""""
set backup
set backupcopy=auto
set backupdir=~/tmp/vim/bkup
"set nobackup
"set nowritebackup
"set noswapfile

""""""""""""""""""""""""
" Fast saving
""""""""""""""""""""""""
nmap <leader>w :w!<cr>

""""""""""""""""""""""""
" Spell Check
""""""""""""""""""""""""
set spell
"Pressing ,ss will toggle and untoggle spell checking
"map <leader>ss :setlocal spell!<cr>
"
""Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""
" Wrap Scan
""""""""""""""""""""""""
set wrapscan

""""""""""""""""""""""""
" Syntax
""""""""""""""""""""""""
filetype plugin on
syntax on

""""""""""""""""""""""""
" Highlighting
""""""""""""""""""""""""

""""""""""""""""""""""""
" Mouse
" Allow using the mouse everywhere.
"""""""""""""""""""""""
set mouse=a

""""""""""""""""""""""""
" Restore cursor position
""""""""""""""""""""""""
"if has("autocmd")
"au BufReadPost * if line("") > 1 && line(\"") <= line("$") | exe "normal! g`\"" | endif
"endif

""""""""""""""""""""""""""""""
" bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 20
let g:miniBufExplSplitBelow=1

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current 
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in 
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer
" }

""""""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""""
"let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

set gfn=Pragmata\ 10
set shell=/bin/bash
set t_Co=256
"  set t_AB=^[[48;5;%dm
"  set t_AF=^[[38;5;%dm

if has("gui_running")
  set guioptions-=T
  set t_Co=256
"  set t_AB=^[[48;5;%dm
"  set t_AF=^[[38;5;%dm
  set background=dark
  "colorscheme peaksea
  "colorscheme ir_black
  colorscheme 256-grayvim
  set nonu
else
    set t_Co=256
"    set t_AB=^[[48;5;%dm
"    set t_AF=^[[38;5;%dm
  set background=dark
  "colorscheme zellner
  "colorscheme bw
  "colorscheme ir_black
  "colorscheme solarized
  "colorscheme badwolf
  colorscheme CapsulaPigmentorum
  set nonu
endif

" As much as possible of the last line in a window will be displayed. When not
" included, a last line that doesn't fit is replaced with "@" lines.
set display=lastline

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

""""""""""""""""""""""""""""""
" Vim user interface
""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""""""""""""""""""""""""""""""
" Nerdtree stuff
""""""""""""""""""""""""""""""
"Increase window size to 9 columns
let NERDTreeVinSize=9

"nmap <F10> to toggle NERDTree window
nmap <silent> <F10> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" Toggle Line Numbers
""""""""""""""""""""""""""""""
"nmap <F6> to set unset Line Numbers
"Set No Line Numbers and use Toggle
set nonu
nmap <silent> <F6> :set nu!<CR>

" Threshold for reporting number of lines changed.
set report=0

" Enable the ruler with the format:
" {buffer number}{modified/readonly flag}: {file type} [current line,
" current column] {position percentage in file}
set ruler
set rulerformat=%25(%n%m%r:\ %Y\ [%l,%v]\ %p%%%)

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

" Shorter messages.
set shortmess=as 

" Show (partial) command in status line.
set showcmd

" Do not redraw while running macros (much faster).
set lazyredraw 

" What to show when you do :set list.
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Some useful keys for vimgrep
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

""""""""""""""""""""""""""""""
" Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

""""""""""""""""""""""""""""""
" Moving around tabs and buffers
""""""""""""""""""""""""""""""
"Useful when moving accross long lines
map j gj
map k gk

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew! %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" Return to last edit position (You want this!) *N*
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif


"Remeber open buffers on close
"set viminfo^=%

""""""""""""""""""""""""""""""
" Toggling syntax highlighting
"""""""""""""""""""""""""""""
function! ToggleSyntax()
	if exists("g:syntax_on")
		syntax off
	else
		syntax enable
	endif
endfunction

nmap <silent>  ;s  :call ToggleSyntax()<CR>

""""""""""""""""""""""""""""""
" Creating centered titles
"""""""""""""""""""""""""""""
function! CapitalizeCenterAndMoveDown()
	s/\<./\u&/g   "Built-in substitution capitalizes each word
	center        "Built-in center command centers entire line
	+1            "Built-in relative motion (+1 line down)
endfunction

nmap <silent>  \C  :call CapitalizeCenterAndMoveDown()<CR>

" vim:set spell spl=en ts=4 sw=4 sts=4 sta noet fenc=utf-8 ff=unix:
