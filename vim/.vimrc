
" Basic Setup {{{

set nocompatible                " be iMproved, required
filetype off                    " required
syntax enable                   " Turn on syntax highlighting allowing local overrides
set t_Co=256

let mapleader=","               " Remap leader to ,
set encoding=utf-8              " Set default encoding to UTF-8
set tags=./tags,./.tags,tags,.tags;/
set clipboard=unnamed

set number                      " Show line numbers
set ruler                       " Show line and column number
set colorcolumn=80              " Display line at 80 chars

set modelines=1                 " Check for file settings

set undolevels=1000             " use many muchos levels of undo
set history=1000                " remember more commands and search history

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


" Sessions {{{

let g:PathToSessions = $HOME."/.vim/sessions/"

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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" Plugins

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'ap/vim-css-color'
Bundle 'groenewege/vim-less'
Bundle 'majutsushi/tagbar'
Bundle 'miyakogi/conoline.vim'
Bundle 'mileszs/ack.vim'
Bundle 'mhinz/vim-startify'
Bundle 'nvie/vim-flake8'

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


" Plugin / NERDTree {{{

let NERDTreeIgnore = ['\.DS_Store$', '\.pyc$', '^tags$']
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers = 0

" Auto close NT
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" }}}


" Plugin / neocomplcache {{{

let g:neocomplcache_enable_at_startup = 1

" }}}


" Plugin / Tagbar {{{

map <leader>rt :TagbarToggle<CR>

" }}}


" Plugin / Neocomplcache {{{

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" }}}


" Plugin / Syntastic {{{

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" }}}
"


" Plugin / ConoLine {{{

let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal = 1

" }}}


" Plugin / Control+p {{{

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.idea$\|\.svn$\|node_modules$|venv$|',
  \ 'file': '\.pyc$\|\.DS_Store$\|\.DS_Store$'
  \ }
map <leader>b :CtrlPBuffer<CR>

" }}}


" Plugin / Easymotion {{{

hi link EasyMotionTarget NonText
hi link EasyMotionTarget2First NonText
hi link EasyMotionTarget2Second NonText

" }}}


" Plugin / Startify {{{

if !empty(glob("~/dotfiles/vim/startify_bookmarks.vim"))
    source ~/dotfiles/vim/startify_bookmarks.vim
endif

let g:startify_custom_header = [
            \ 'Simplicity is prerequisite for reliability.',
            \ '-------------------------------------------',
            \ ]

" }}}

" vim:foldmethod=marker:foldlevel=0
