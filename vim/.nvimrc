" NVim Basic Setup {{{

" set nocompatible                " be iMproved, required
filetype off                    " required for Vundle
syntax on                       " Turn on syntax highlighting allowing local overrides
set t_Co=256                    " Use 256 colors

"let mapleader=","               " Remap leader to ,
let mapleader = "\<Space>"

set encoding=utf-8              " Set default encoding to UTF-8
set clipboard=unnamed           " Map anonymous register to *

set number                      " Show line numbers
set ruler                       " Show line and column number
set colorcolumn=80              " Display line at 80 chars
set scrolloff=5

set modelines=1                 " Check for file settings

set undolevels=1000             " use many muchos levels of undo
set history=1000                " remember more commands and search history

set tags=./tags,./.tags,tags,.tags;/

set wildmode=full  " fix wildmeny display in neovim

" Move from the neovim terminal window to somewhere else
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" }}}

nnoremap <CR> :wa<CR>:!!<CR>    " Repeat last command


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
nnoremap <leader>s :nohlsearch<CR>

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
Bundle 'ap/vim-css-color'
Bundle 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'groenewege/vim-less'
Plugin 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'jeetsukumaran/vim-filebeagle'
Plugin 'rking/ag.vim'


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


" Plugin / Airline {{{

set laststatus=2
set noshowmode
let g:bufferline_echo = 0
set ttimeoutlen=50
let g:airline_left_sep=""
let g:airline_right_sep=""

" }}}


" Plugin / Easymotion {{{

hi link EasyMotionTarget NonText
hi link EasyMotionTarget2First NonText
hi link EasyMotionTarget2Second NonText

" }}}


" Plugin / Control+p {{{

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore venv
    \ --ignore node_modules
    \ --ignore "**/*.pyc"
    \ -g ""'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.idea$\|\.svn$\|node_modules$|venv$',
  \ 'file': '\.pyc$\|\.DS_Store$\|\.DS_Store$'
  \ }
map <leader>b :CtrlPBuffer<CR>

" }}}


" Plugin / Syntastic {{{

" Angular
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" }}}


" Plugin / vim-python {{{

" Dont fold code
let g:pymode_folding = 0

" Disable quickfix window if lint error occurs
let g:pymode_lint_cwindow = 0

" Use jedi instead for autocomplete
let g:pymode_rope = 0

" Remap breakpoint
let g:pymode_breakpoint_bind = '<leader>k'

" }}}


" Plugin / eocomplcache {{{

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" }}}


" Plugin / Nerdtree {{{

let NERDTreeIgnore = ['\.DS_Store$', '\.pyc$', '^tags$']
let NERDTreeMinimalUI = 1
map <leader>n :NERDTreeToggle<CR>

" }}}

