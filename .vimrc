"Use Vim settings, rather then Vi settings (much better!). This must be
" first, because it changes other options as a side effect.
set nocompatible

" ========== Leader Config ==========

" Make , the default shortcut key. This allows us to easily add custom
" key mappings later on without breaking any of Vim's default functionality.
let mapleader=","

" ========== Vundle Initialization ==========
" Required for Vundle to work properly. Disabled file type detection.
filetype off

" This loads all the plugins in ~/.vim/bundle.
set rtp+=~/.vim/bundle/vundle/
" Install and manage all our Vim scripts using Vundle. To install (or update)
" all these scripts at once, run:
"
"   :BundleInstall
"
" To remove unused scripts, run:
"
"   :BundleClean
" source ~/.vim.scripts

" ========== General Config ==========

set number                      " Line numbers are good.
set rnu                         " Relative Line Numbers
set backspace=indent,eol,start  " Allow backspace in insert mode.
set history=1000                " Store lots of :cmdline history.
set showcmd                     " Show incomplete cmds down the bottom.
set showmode                    " Show current mode down the bottom.
set hidden                      " Allow buffers to exist in the background.
set autoread                    " Reload files changed outside vim
set list                        " Display unprintable characters.
set listchars=tab:▸\ ,trail:·,eol:¬ " Make tabs, trailing whitespace, and EOL characters easy to spot.
syntax on                       " Enable syntax highlighting.
:inoremap jk <Esc>
:inoremap kj <Esc>
:inoremap <c-u> <esc>bvwU<esc>ea
:noremap <c-u> bvwU<esc>e
:noremap <leader>= i<% %><Esc>bhi
:noremap io :w<CR>
:noremap oi :w<CR>
:noremap - ddp
:noremap _ ddkP
:noremap \ dd
:noremap <leader>ev :vsplit $MYVIMRC<cr>

set timeoutlen=250
" ========== Search Settings ==========

set incsearch                   " Find the next match as we type the search.
set smartcase                   " Search by case only if specified.
set hlsearch                    " Hilight searches by default.
set ignorecase                  " Allow case searches.
set viminfo='100,f1             " Save up to 100 marks, enable capital marks.

" ========== Swap Files ==========

set noswapfile                  " Don't use a swapfile for buffers.
set nobackup                    " Disable file backups when writing files.
set nowritebackup               " Don't backup before overwriting files.

" ========== Persistent Undo ==========

set undodir=~/.vim/undodir      " Store all change information in a undodir.
set undofile                    " Write changes to the undofile.
set undolevels=1000             " Maximum number of changes that can be undone.
set undoreload=10000            " Maximum number lines to save for undo on a buffer reload.

" ========== Indentation ==========

set autoindent                  " Copy indent from current line when starting a new line.
set smartindent                 " Do smart autoindenting when starting a new line.
set smarttab                    " A <tab> in front of a line inserts spaces.
set shiftwidth=2                " Number of spaces to use for each step of autoindent.
set shiftround                  " aligns tabs
set softtabstop=2               " Number of spaces that a <tab> counts for while editing.
set tabstop=2                   " Number of spaces that a <tab> in the file counts for.
set expandtab                   " Use the appropriate number of spaces to insert a <tab>.

" Set smaller tab settings for HTML type stuff.
au FileType coffee,javascript,css,xml,xhtml,html,htmldjango,haml,json set shiftwidth=2 tabstop=2

" ========== Editor Width ==========

set nowrap                      " Don't wrap lines.
set linebreak                   " Wrap lines when convenient. This doesn't effect text, only display.
set textwidth=120                " Make all lines 79 chars or less.

" ========== Filetype Config ==========

filetype plugin on              " Automatically load filetype specific configs.
filetype indent on              " Automatically load filetype specific indent configs.

" ========== Folds ==========

"set foldmethod=indent           " Fold based on indent.
"set foldnestmax=3               " Limit folds to three levels of depth.
"set foldenable                  " Fold by default.

" ========== Completion ==========

set wildmode=list:longest       " When more than one match, list all and look for the longest.
set wildmenu                    " Auto complete command line operations using <tab> and <ctr-p>/<ctr-n>.
set wildignore=*.o,*.obj,*~     " Filenames to ignore when auto completing.
set wildignore+=*vim/backups*   " (continued)
"set wildignore+=*.pyc,*.pyo     " (continued)

" ========== Scrolling ==========

set scrolloff=8                 " Minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=15            " Minimal number of screen columns to keep to the left and the right of the cursor.
set sidescroll=1                " Minimal number of columns to scroll horizontally.

" ========== Reload ==========

" Automatically reload Vim if you make changes to vimrc.
augroup reloadvim
    au!
    au BufWritePost vimrc,.vimrc source $MYVIMRC | if ("gui_running") | so $MYGVIMRC | endif
augroup end

autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands



call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set t_Co=256
" colorscheme wombat
" colorscheme railscasts
" colorscheme ubloh
" colorscheme lucius
" colorscheme solarized
" colorscheme mustang
" colorscheme smyck
colorscheme molokai
"colorscheme vividchalk
"colorscheme twilight256
au BufRead,BufNewFile *.ru setfiletype ruby
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

au BufRead,BufNewFile *.scala set filetype=scala
au! Syntax scala source ~/.vim/bundle/vim-scala/syntax/scala.vim

:iabbrev ssig -- <cr>Tyler Nisonoff<cr>tylernisonoff@gmail.com
hi Normal ctermbg=NONE
