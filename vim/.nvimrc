" NVim Basic Setup {{{

" be iMproved, required
set nocompatible

" Turn on syntax highlighting allowing local overrides
syntax on

" Use 256 colors
set t_Co=256

" Remap leader to space
let mapleader = "\<Space>"

" Set default encoding to UTF-8
set encoding=utf-8

" Map anonymous register to *
set clipboard=unnamed
"
" Use hybrid line mode
set relativenumber
set number

" Show line and column number
set ruler

" Display line at 80 chars
set colorcolumn=80

" Always show lines below the marked line
set scrolloff=5

" Check for file settings
set modelines=1

" use many levels of undo
set undolevels=1000

" remember more commands and search history
set history=1000

set tags=./tags,./.tags,tags,.tags;/

" fix wildmeny display in neovim
set wildmode=full

" Repeat last command
nnoremap <leader><CR> :wa<CR>:!!<CR>

if has("nvim")
    " Enable inccommand
    set inccommand=nosplit
endif


" Backup {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" }}}


" Buffers {{{

" Switch to previous buffer
nmap <leader>p :e#<CR>

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

" Detect project defined vim settings
silent! so .vimlocal

" Plugins {{{

" Automatically install plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'ap/vim-css-color'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'groenewege/vim-less'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
if has("nvim")
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'machakann/vim-highlightedyank'
Plug 'wfleming/vim-codeclimate'
Plug 'SirVer/ultisnips'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'editorconfig/editorconfig-vim'
Plug 'chr4/nginx.vim'
Plug 'slashmili/alchemist.vim'
Plug 'elmcast/elm-vim'


" Add plugins to &runtimepath
call plug#end()
filetype plugin indent on


" }}}

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif


" Wild settings {{{

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc

" Disable images
set wildignore+=*.png,*.jpg,*.gif

" Disable packages
set wildignore+=*/node_modules

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" }}}


" Statusline settings {{{

" Always show statusline
set laststatus=2

" Remove escape key delay
set ttimeoutlen=50

" Update statusline
let &statusline='%.50f [%{exists("*fugitive#head")?fugitive#head():""}] %r %= %c%V | %y %l/%L'

" }}}


" Plugin / Solarized (Colors) {{{

set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=16
colorscheme solarized

" }}}


" Plugin / Easymotion {{{

hi link EasyMotionTarget NonText
hi link EasyMotionTarget2First NonText
hi link EasyMotionTarget2Second NonText
let g:EasyMotion_keys = 'qwertyuiopåasdfghjklöäzxcvbnm'

" }}}


" Plugin / Syntastic {{{

" Angular
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

" }}}


" Plugin / python-mode {{{

let g:pymode_python='python3'
let g:pymode_folding = 0

" }}}


" Plugin / vim-jedi {{{

" Show documentation
let g:jedi#documentation_command = "<leader>m"

" }}}


" Plugin / Netrw {{{

" Open netrw on -
nmap - :Explore<CR>

" Hide header
let g:netrw_banner=0

" Disable some filetypes per default
let g:netrw_list_hide='\.pyc$,^\.DS_Store$,\.o$,^\.git/$'

" }}}


" "Plugin / CodeClimate {{{

nmap <Leader>aa :CodeClimateAnalyzeProject<CR>
nmap <Leader>ao :CodeClimateAnalyzeOpenFiles<CR>
nmap <Leader>af :CodeClimateAnalyzeCurrentFile<CR>

" " }}}


" Plugin / UltiSnips {{{

let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsEditSplit='vertical'

set runtimepath+=~/dotfiles/snippets/
let g:UltiSnipsSnippetsDir='~/dotfiles/snippets/UltiSnips/'

" " }}}


" Plugin / deoplete {{{
if has("nvim")

    " Activate deoplete on startup
    let g:deoplete#enable_at_startup = 1

    " Enable utilsnips in deoplete
    call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

endif
" }}}


" Plugin / fzf {{{
"
let g:fzf_nvim_statusline=0
let g:fzf_files_options='--preview "cat {}"'
nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Ag<CR>
" }}}
