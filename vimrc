set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'dag/vim-fish'
Plugin 'mattn/emmet-vim'
Plugin 'roman/golden-ratio'
Plugin 'sheerun/vim-polyglot'
Plugin 'alvan/vim-closetag'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-projectionist'

Plugin 'rbgrouleff/bclose.vim'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'

Plugin 'ctrlpvim/ctrlp.vim'

" Airline
Plugin 'enricobacis/vim-airline-clock'
Plugin 'bling/vim-airline'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Colorschemes
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'

Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'plasticboy/vim-markdown'
Plugin 'slashmili/alchemist.vim'

" Phoenix
Plugin 'c-brenn/phoenix.vim'

Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

Plugin 'Quramy/tsuquyomi'
Plugin 'ervandew/supertab'

call vundle#end()
filetype plugin on

"----------------------------------------------
" General settings
"----------------------------------------------
syntax enable

set encoding=utf-8
set autoindent
set smartindent
set autoread
set colorcolumn=81
set cursorline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:\|\ ,trail:▫
set nospell
set noswapfile
set nowrap
set noerrorbells
set number
set relativenumber
set ruler
set textwidth=80
set title
set updatetime=100
set scrolloff=5
set t_Co=256
set backspace=indent,eol,start

"----------------------------------------------
" Plugin: bling/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#ale#enabled = 1

"----------------------------------------------
" Map Leader
"----------------------------------------------
let mapleader = ','

"----------------------------------------------
" Colors
"----------------------------------------------
set background=dark
colorscheme PaperColor

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch
set hlsearch

"----------------------------------------------
" Fuzzy finder ignore file
"----------------------------------------------
set wildignore=*.gif,*.png,*.jpg,*/node_modules,*/build,*/deps,*/_build

"----------------------------------------------
" Plugin: ctrlpvim/ctrlp.vim
"----------------------------------------------
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build)|(\.(swp|ico|git|svn|png|jpg|lock))$'

"----------------------------------------------
" Golang Syntax
"----------------------------------------------
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1

let g:tsuquyomi_completion_detail = 1

"----------------------------------------------
" CloseTag
"----------------------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'

"----------------------------------------------
" Mapping Configuration
"----------------------------------------------
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>


"----------------------------------------------
" Dont let me Arrow Keys
"----------------------------------------------
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"----------------------------------------------
" Make `jj` and `jk` throw you into mode
"----------------------------------------------
inoremap jj <esc>
inoremap jk <esc>