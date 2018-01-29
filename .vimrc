" Configuration file for Vim
" Sean Nesdoly 
" 2017-01-29

" Vundle Plugins
set nocompatible	" be iMproved
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" UI configurations
colorscheme wombat256i  " Vim's colorscheme. other options: molokai, solarized, wombat
set wildmenu            " visual autocomplete for the command menu
set showmatch 	        " highlight matching [{()}]

" Text-processing settings
syntax enable           " enable syntax processing
set spelllang=en_ca     " canadian spellchecking

" Tab settings
set tabstop=4       " number of spaces a tab counts for 
set softtabstop=4   " sets the number of columns for a tab 
set shiftwidth=4    " indents will have a width of 4
set expandtab       " tabs are spaces!

" Editor settings
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become sensitive if you type uppercase characters
set autoindent          " autoindents paragraphs
set smartindent         " (mostly) indents files correctly
set smarttab            " smart tab handling for indenting
set tw=80               " textwidth = 80 characters
"set colorcolumn=80	    " highlight characters in columns > 80

" Search Settings
set hlsearch " highlight search matches

" Disable vim-markdown folding
let g:vim_markdown_folding_disabled = 1
