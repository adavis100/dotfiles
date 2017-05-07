set nocompatible        " be iMproved, required
colorscheme slate      " colorscheme slate
set guifont=Monaco:h13

"
" Spaces & Tabs
"
set backspace=2         " backspace in insert mode works like normal editor
" default indent of 2 spaces
set tabstop=2           " number of visual spaces per tab
set softtabstop=2       " number of spaces in tab when editing
set shiftwidth=2     
set expandtab           " tabs are spaces
autocmd Filetype java setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype ruby setlocal ts=4 sw=4 sts=4 expandtab

" search down into subfolders
" provides tab completion for all file-related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu

" show at least one line of context above/below cursor
set scrolloff=1

" read file if changed outside vim
set autoread

set history=1000

" Use system clipboard
set clipboard=unnamed

"
" UI Config 
"
syntax on               " syntax highlighting
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
filetype indent on      " activates indenting for files
"set smartindent          " auto indenting
set relativenumber              " line numbers
set showmatch           " highlight matching [{()}]
set nobackup            " get rid of annoying ~file

"
" Misc
"
filetype plugin on
set omnifunc=syntaxcomplete#Complete        " enable omni completion, i.e., smart autocompletion with <C-X><C-O> 

"
" Status line
"
set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
set laststatus=2        " always display status

"
" Searching
"
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " case insentitive
set smartcase           " unless pattern includes uppercase

" ctags optimization
set autochdir
set tags=tags;

"
" Remap arrow keys (to be sure not to use them)
"
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Notes directory for vim notes plugin
let g:notes_directories = ['~/Documents/Notes']

" set update time to 250ms (from 4s default)
" this is time vim wait to trigger plugins after typine stops
set updatetime=250

"
" Key mappings
"

" Map leader to space bar
let mapleader = "\<Space>"

function! NumberToggle()
  "  Toggle between showing/hidding the numbers.
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

"  Map Leader+n to NumberToggle
nnoremap <Leader>n :call NumberToggle()<cr>

function! PasteToggle()
  " Toggle paste mode
  if(&paste == 1)
    set nopaste
    set number
    set relativenumber
    GitGutterEnable
  else
    set paste
    set norelativenumber
    set nonumber
    GitGutterDisable
  endif
endfunc

" Map Leader+z to PasteToggle
nnoremap <Leader>z :call PasteToggle()<cr>

" Leader+l redraws the screen and removes any search highlighting.
nnoremap <silent> <Leader>l :nohl<CR><C-l>

" Leader+w to save file
nnoremap <Leader>w :w<CR>
nnoremap <leader>q :q<cr>

" Copy & paste to system clipboard with <Leader>p and <Leader>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
