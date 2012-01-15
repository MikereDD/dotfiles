"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Mike Redd a lazy sob.
"             http://m-redd.com
"
" Version: 1.0 - 01/14/12 23:10:58
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""
" 256 Color help when on other systems
""""""""""""""""""""""""
if &term =~# '^\(screen\|rxvt\|xterm\)$'
    set t_Co=256
endif

""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
""""""""""""""""""""""""
set history=700

""""""""""""""""""""""""
" Enable filetype plugin
""""""""""""""""""""""""
filetype plugin on
filetype indent on

""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
""""""""""""""""""""""""
set autoread

""""""""""""""""""""""""
" Backup files
""""""""""""""""""""""""
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
" Always hide the statusline
set laststatus=2

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
  "colorscheme zellner
  "colorscheme bw
  colorscheme railscasts
  set background=dark
  set nonu
endif

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
