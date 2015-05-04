" NVim Basic Setup {{{

" set nocompatible                " be iMproved, required
filetype off                    " required for Vundle
syntax enable                   " Turn on syntax highlighting allowing local overrides
set t_Co=256                    " Use 256 colors

let mapleader=","               " Remap leader to ,
set encoding=utf-8              " Set default encoding to UTF-8
set clipboard=unnamed           " Map anonymous register to *

set number                      " Show line numbers
set ruler                       " Show line and column number
set colorcolumn=80              " Display line at 80 chars

set modelines=1                 " Check for file settings

set undolevels=1000             " use many muchos levels of undo
set history=1000                " remember more commands and search history

set tags=./tags,./.tags,tags,.tags;/

" }}}


" Backup {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" }}}


" Buffers {{{

map <leader>p <c-^>             " Switch to previous buffer

" }}}

" Whitespace {{{

" set smartindent
set autoindent                  " use previous lines idention
set tabstop=4                   " a hard TAB displays as 4 columns
set shiftwidth=4                " operation >> indents 4 columns; << unindents 4 columns
set expandtab                   " insert spaces when hitting TABs
set softtabstop=4               " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround                  " round indent to multiple of 'shiftwidth'
set list                        " Show invisible characters
set backspace=indent,eol,start  " backspace through everything in insert mode


" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
" }}}


" Searching {{{

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" highlight last inserted text
nnoremap gV `[v`]


" }}}


" Vundle {{{

filetype off                    " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" Plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'nvie/vim-flake8'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'



" Close Vundle
call vundle#end()
filetype plugin indent on

" }}}


" Wild settings {{{

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable images
set wildignore+=*.png,*.jpg,*.gif

" Disable packages
set wildignore+=*/node_modules

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" }}}


" Plugin / Solarized (Colors) {{{

set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=16
colorscheme solarized

" }}}


" Plugin / Control+p {{{

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.idea$\|\.svn$\|node_modules$|venv$',
  \ 'file': '\.pyc$\|\.DS_Store$\|\.DS_Store$'
  \ }
map <leader>b :CtrlPBuffer<CR>

" }}}


" Plugin / Syntastic {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0"

" Angular
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" }}}
