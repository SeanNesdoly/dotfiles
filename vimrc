" Configuration file for Vim
" Sean Nesdoly
" Date created: 2017-01-29

" UI configurations
set background=dark            " high-contrast background, for the eyes
colorscheme desert             " https://vimcolorschemes.com/
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

