syntax enable           " enable syntax processing
colorscheme monokai		" Sublime Text 2 theme

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set number              " show line numbers
set ruler
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set t_Co=256            " set 256 colors
set t_ut=               " disable werid background color with custom theme

" set smartindent
" set shiftwidth=4
" set backspace=indent,eol,start
" set ruler
" set number
" set showcmd
" set incsearch
" set hlsearch

" set the runtime path to include Vundle and initialize
set rtp +=~/.vim/bundle/Vundle.vim

" ---------------- PLUGIN STARTS ------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

call vundle#end()

" ------- NERDTREE settings
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
