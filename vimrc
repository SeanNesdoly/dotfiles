" Configuration file for Vim
" Sean Nesdoly
" Date created: 2017-01-29

" UI configurations
set background=dark            " high-contrast background, for the eyes
colorscheme desert             " https://vimcolorschemes.com/
set wildmenu                   " visual autocomplete for the command menu
set hlsearch                   " highlight search matches
set showmatch                  " highlight matching [{()}]
set ruler                      " show line & column number
set relativenumber             " show relative line numbers
set number                     " show actual line number for current line
set cursorline                 " highlight the current line

" Text-processing settings
syntax enable                  " enable syntax processing
set backspace=indent,eol,start " make 'delete' key work in insert mode
set spelllang=en_ca            " Canadian spellchecking

" Tab settings
set tabstop=4                  " number of spaces a tab counts for
set softtabstop=4              " set the number of columns for a tab
set shiftwidth=4               " width of indents, mostly for >> and <<
set expandtab                  " replace tabs with spaces!
set smarttab                   " smart tab handling for indenting

" Editor settings
"set colorcolumn=80	    " highlight characters in columns > 80
set esckeys                    " map missed escape sequences (enables keypad keys)
set ignorecase                 " case-insensitive searching
set smartcase                  " case-sensitive searching with uppercase characters
set autoindent                 " autoindent paragraphs
set smartindent                " (mostly) indent files correctly
set textwidth=80               " treat 80 characters as the standard line length

