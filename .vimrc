"
" .vimrc
"     written by t-nakaym 2009/04/29
"     See also http://relaxedcolumn.blog8.fc2.com/blog-entry-101.html    
"

" general settings
set nocompatible
set viminfo='20,<50,s10,h,!
set shellslash
set lazyredraw
colorscheme desert

" tab settings
set tabstop=4 shiftwidth=4 softtabstop=0
set expandtab
set autoindent smartindent

" input support settings
set backspace=indent,eol,start
set formatoptions+=m

" command completion settings
set wildmenu
set wildmode=list:full

" search settings
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch

" file settings
set nobackup
set autoread
set noswapfile
set hidden

" display settings
set showmatch
set showcmd
set number
set wrap
set list
set listchars=tab:>\
set notitle
set scrolloff=5

" status line settings
set laststatus=2
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m

" encoding settings
set ffs=unix,dos,mac

" auto encoding recognition settings
set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

set ambiwidth=double

" syntax coloring settings
syntax on

set complete+=k
filetype indent on
filetype plugin on

set completeopt=menu,preview,menuone
