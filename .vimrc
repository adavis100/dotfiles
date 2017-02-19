set nocompatible        " be iMproved, required
colorscheme desert      " colorscheme desert

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

"
" UI Config 
"
syntax on               " syntax highlighting
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
filetype indent on      " activates indenting for files
"set smartindent          " auto indenting
set number              " line numbers
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
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>


"
" Key mappings
"

