" Configuration file for Vim
" Sean Nesdoly
" Date created: 2017-01-29
" ------------------------------------------------------------------------------

" ------------------------------ UI configurations -----------------------------
" Colour scheme (https://vimcolorschemes.com/)
let g:gruvbox_contrast_dark='hard'
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark            " high-contrast background, for the eyes

" Highlight current line and toggle it when entering or leaving INSERT mode
set cursorline
autocmd InsertEnter * setlocal nocursorline
autocmd InsertLeave * setlocal cursorline

" Change cursor style based on current mode by defining Vim's
" 'terminal-output-codes' for use with Unix's 'terminfo' database
let &t_SI = "\033[6 q"         " start INSERT mode (steady pipe, xterm)
let &t_EI = "\033[1 q"         " end INSERT mode (blinking block)
let &t_TI = "\033[1 q"         " terminal initialization string (fixes bug when
                               " using custom cursors in readline's vi mode)
let &t_SR = "\033[4 q"         " start REPLACE mode (steady underline)

" Status (last) line
set showmode                   " display current mode on last line
set ruler                      " show line & column number
set laststatus=2               " show status line, even with only 1 window
set showcmd                    " show partial commands on last line

" Line numbers
set relativenumber             " show relative line numbers
set number                     " show actual line number for current line

set lazyredraw                 " delay redraw for macros, untyped commands

" -------------------------- Text-processing settings --------------------------
syntax enable                  " enable syntax processing
set backspace=indent,eol,start " make 'delete' key work in insert mode
set encoding=utf8              " UTF-8 character encoding
set spell spelllang=en_ca      " Canadian spellchecking (z=, [s, ]s)

" Detect <Esc> sequences with function keys (e.g., arrows) in Insert mode. To
" quickly detect a single <Esc> sequence in Insert mode, we set 'ttimeoutlen' to
" >=0 (default -1, unused).
set esckeys
set timeoutlen=3000            " Time out on firing mappings
set ttimeoutlen=10             " Time out on key codes

" --------------------------- Highlight search hits ----------------------------
set hlsearch                   " highlight search matches
set incsearch                  " show hits while typing a pattern
set ignorecase                 " case-insensitive searching
set smartcase                  " case-sensitive searching with uppercase letters

set showmatch                  " highlight matching brackets --> [{()}]
set wildmenu                   " visual autocomplete for the command menu

" ----------------------- Tab settings, indent behaviour -----------------------
set tabstop=4                  " number of spaces a tab counts for
set softtabstop=4              " set the number of columns for a tab
set shiftwidth=4               " width of indents, mostly for >> and <<
set expandtab                  " replace tabs with spaces!
set smarttab                   " smart tab handling for indenting
set autoindent                 " autoindent paragraphs
set smartindent                " (mostly) indent files correctly

" -------------------------------- Line display --------------------------------
set textwidth=80               " treat 80 characters as the standard line length
set colorcolumn=+1             " highlight characters in the column textwidth+1
set linebreak                  " break lines, intelligently
set nowrap                     " to avoid confusion, do not visually wrap lines

" ------------------------------ Advanced settings -----------------------------
" Retain local undo tree by hiding buffers, rather than abandoning them
set hidden

" ------------------------- Custom leader key mappings -------------------------
" Primary leader key: space (akin to spacemacs)
let mapleader = "\<Space>"

" Split windows, evil-like
nnoremap <Leader>ws :sp<CR>
nnoremap <Leader>wS :sp<CR>:wincmd j<CR>
nnoremap <Leader>wv :vsp<CR>
nnoremap <Leader>wV :vsp<CR>:wincmd l<CR>

" Window navigation, evil-like
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wl :wincmd l<CR>

" Window movement, evil-like
nnoremap <Leader>wH :wincmd H<CR>
nnoremap <Leader>wJ :wincmd J<CR>
nnoremap <Leader>wK :wincmd K<CR>
nnoremap <Leader>wL :wincmd L<CR>

" Close current window
nnoremap <Leader>wd :close<CR>

" Built-in directory exploration (splits horizontally)
nnoremap <Leader>ft :Hexplore<CR>

" List buffers
nnoremap <Leader>bb :ls<CR>:b<Space>

" Switch to the buffer that was last used
nnoremap <Leader><Tab> :e#<CR>

" Find files, buffers, lines, and marks with fzf.vim
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fF :Files<Space>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fm :Marks<CR>
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>gs :GFiles?<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" YouCompleteMe
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" ------------- Vim Plugin Manager (github.com/junegunn/vim-plug) --------------
" vim-plug commands:
"   PlugInstall [name ...]
"   PlugUpdate [name ...]
"   PlugStatus
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'easymotion/vim-easymotion'
call plug#end()

