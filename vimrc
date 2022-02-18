" Configuration file for Vim
" Sean Nesdoly
" Date created: 2017-01-29

" UI configurations
set background=dark            " high-contrast background, for the eyes
colorscheme desert             " https://vimcolorschemes.com/
set showmode                   " show when in Insert, Replace, or Visual modes
set showcmd                    " show partial commands on last line of screen
set ruler                      " show line & column number
set relativenumber             " show relative line numbers
set number                     " show actual line number for current line
"set cursorline                 " highlight the current line

" Text-processing settings
syntax enable                  " enable syntax processing
set backspace=indent,eol,start " make 'delete' key work in insert mode
set esckeys                    " map missed escape sequences (enables keypad keys)
set encoding=utf8              " UTF-8 character encoding
set spelllang=en_ca            " Canadian spellchecking

" Highlight search hits
set hlsearch                   " highlight search matches
set incsearch                  " show hits while typing a pattern
set ignorecase                 " case-insensitive searching
set smartcase                  " case-sensitive searching with uppercase characters

set showmatch                  " highlight matching brackets --> [{()}]
set wildmenu                   " visual autocomplete for the command menu

" Tab settings, indent behaviour
set tabstop=4                  " number of spaces a tab counts for
set softtabstop=4              " set the number of columns for a tab
set shiftwidth=4               " width of indents, mostly for >> and <<
set expandtab                  " replace tabs with spaces!
set smarttab                   " smart tab handling for indenting
set autoindent                 " autoindent paragraphs
set smartindent                " (mostly) indent files correctly

" Break lines
set textwidth=80               " treat 80 characters as the standard line length
set linebreak                  " break lines, intelligently
"set colorcolumn=80            " highlight characters in columns > 80

" ------------------------- Custom leader key mappings -------------------------
" Primary leader key: space (akin to spacemacs)
let mapleader = "\<Space>"

" List buffers
nnoremap <Leader>bb :ls<CR>:b

" Switch to the buffer that was last used
nnoremap <Leader><Tab> :e#<CR>

" ------------- Vim Plugin Manager (github.com/junegunn/vim-plug) --------------
" PlugInstall [name ...]
" PlugUpdate [name ...]
" PlugStatus
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/vim-easy-align'
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
