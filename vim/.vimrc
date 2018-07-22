" enable syntax processing
syntax enable           

" Sublime Text 2 theme
colorscheme monokai		
colorscheme monokai_pro

" number of visual spaces per TAB
set tabstop=4		

" number of spaces in tab when editing
set softtabstop=4

" show line numbers
set number              

" show relative line numbers
" set relativenumber		

" always show current position
set ruler		

" highlight current line
set cursorline

" highlight matching [{()}]
set showmatch

" set 256 colors
set t_Co=256

" disable werid background color with custom theme
set t_ut=

" Set to auto read when a file is changed from the outside
set autoread

" Set ignorecase when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like in modern browsers
set incsearch

" Highlight search results
set hlsearch

" Turn backup off, since most of the stuff is in Git anyway
set nobackup
set nowb
set noswapfile

" Set spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab = 4spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai 

" Smart indent
set si

" Wrap lines
set wrap

" Set max width for :Vexplore file explorer
let g:netrw_winsize = 20

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Change directory to the current buffer when opening files.
set autochdir