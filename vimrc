" Configuration file for Vim
" Sean Nesdoly
" Date created: 2017-01-29

" UI configurations
"colorscheme wombat256i  " Vim's colorscheme. other options: molokai, solarized, wombat
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
