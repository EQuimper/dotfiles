" PLUGINS

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'rbgrouleff/bclose.vim'
Plug 'ajh17/VimCompletesMe'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Javascript
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" Elixir
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'

" Linting
Plug 'w0rp/ale'

" Format
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
Plug 'mhinz/vim-mix-format'

" Theme and Syntax Color
Plug 'rafi/awesome-vim-colorschemes'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}


call plug#end()

" MAPPINGS
let mapleader = ','
nmap <C-p> :<C-u>FZF<CR>

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

nmap <leader>c :nohlsearch<cr>

autocmd FileType javascript noremap <leader>p :Prettier<cr>
autocmd FileType elixir noremap <leader>p :MixFormat<cr>

noremap <Leader>b :Buffers<CR>
noremap <Leader>h :History<CR>

tnoremap jj <C-\><C-n>

" Dont let use Arrow Keys
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

" Move between buffers with Shift + arrow key...
nmap <S-Left> :bprevious<cr>
nmap <S-Right> :bnext<cr>
nnoremap <leader>w :Bclose!<cr>

nmap <C-n> :NERDTreeToggle<CR>

inoremap jj <esc>
inoremap jk <esc>

" fugitive git bindings
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gb :Git branch<Space>
" nnoremap <space>ga :Git add %:p<CR><CR>

" LINTING
let g:ale_inters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['tslint']
\}

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" GENERAL SETTINGS
syntax enable
colorscheme molokai
set background=dark

set splitbelow
set splitright

set cursorline
set cursorcolumn
set colorcolumn=81

set mouse=a

set shell=zsh
set encoding=utf-8
set autoindent
set smartindent
set autoread

set tabstop=2
set softtabstop=2
set shiftwidth=2

set nospell
set noswapfile
set nowrap
set noerrorbells
set hidden

set number
set relativenumber

set scrolloff=10

set incsearch
set hlsearch

set wildignore+=*.pyc,*.o,*/.git/*,*/build/*,*.swp,*/.svn,*/.hg

let g:deoplete#enable_at_startup = 1

let g:one_allow_italics = 1

let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends': 'jsx',
\      'quote_char': '"',
\  },
\  'typescript' : {
\ 'extends': 'jsx',
\ 'quote_char': '"',
\  }
\}

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

if $TERM_PROGRAM =~ "iTerm"
	let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
	let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

if (empty($TMUX))
  if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

if &term =~ '256color'
	set t_ut=
endif
