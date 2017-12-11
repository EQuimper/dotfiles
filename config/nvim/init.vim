set nocompatible
filetype plugin indent on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

call plug#begin('~/.vim/plugged')

" Essentials
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-obsession'
Plug 'bronson/vim-trailing-whitespace'

" Time tracking
Plug 'wakatime/vim-wakatime'

" Fuzzy Finding
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ervandew/supertab'

" Airline
Plug 'enricobacis/vim-airline-clock'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

" Linting
Plug 'w0rp/ale'

" Git Utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language Support
Plug 'c-brenn/phoenix.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'fatih/vim-go'
Plug 'slashmili/alchemist.vim'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'mxw/vim-jsx'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript',       { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/deoplete-typescript'
Plug 'ianks/vim-tsx'

" ColorSchemes
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'rakr/vim-one'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set nospell                             " No sound
set formatoptions+=o                    " Continue comment marker in new lines
set showmatch                           " Show matching brackets.
set noswapfile                          " No file create by vim
set nowrap                              " No file create by vim
set noerrorbells                        " No bell sound
set number                              " Show number
set relativenumber                      " RelativeNumber on
set tabstop=2                           " Set tab
set expandtab
set softtabstop=2                       " Set tabStop
set shiftwidth=2                        " Set shiftWidth
set shell=zsh                           " Told neovim which shell we use
set encoding=utf-8                      " Use UTF-8
set autoread                            " If file change outside of the editor, make sure they appear
set scrolloff=5                         " When scroll, always have 5 line top of bottom
set list
set list listchars=tab:»\ ,trail:·,nbsp:·
set numberwidth=5                       " width of the gutter
syntax enable                           " Allow syntax hightlighting
set incsearch                           " Increment search
set hlsearch                            " Hightlight search
set ignorecase                          " Make searching case insensitive
set smartcase                           " ... unless the query has capital letters.
set gdefault                            " Use 'g' flag by default with :s/foo/bar/.
set magic                               " Use 'magic' patterns (extended regular expressions).<Paste>
set title                               " Show title
set smartindent
set autoindent
set ruler
set backspace=indent,eol,start
set undofile                            " Make sure the undo work between session
set splitbelow                          " Split the pane bottom when horizontal
set splitright                          " Split the pane right when vertical

"----------------------------------------------
" Colors
"----------------------------------------------
" let g:gitgutter_override_sign_column_highlight = 0
"
" let g:neosolarized_visibility = "low"
" let g:neosolarized_contrast = "high"
let g:one_allow_italics = 1
set background=dark
colorscheme one
set termguicolors

"----------------------------------------------
" Mapping
"----------------------------------------------
" Set the MapLeader
let mapleader = ','

" Clear search hightlights
map <leader>c :nohlsearch<cr>

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Dont let use Arrow Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Make `jj` and `jk` throw you into mode
inoremap jj <esc>
inoremap jk <esc>

" Move between buffers with Shift + arrow key...
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>

" Move between tab with Shift + arrow key...
nnoremap <S-Up> :tabnext<cr>
nnoremap <S-Down> :tabprevious<cr>

" Terminal Mode mapping
if has ('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

" FZF mapping
nnoremap <C-p> :<C-u>FZF<cr>
map <leader>b :Buffers<cr>

" Ale mapping
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
nmap <leader>d <Plug>(ale_fix)

"----------------------------------------------
" Plugin: rbgrouleff/bclose.vim
"----------------------------------------------
" Close buffers
nnoremap <leader>w :Bclose<cr>

nnoremap <leader>p :Prettier<cr>

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

"----------------------------------------------
" Plugin: w0rp/ale
"----------------------------------------------
let g:ale_linters = {
\    'javascript': ['eslint', 'flow'],
\    'typescript': ['tslint', 'tsserver', 'typecheck'],
\    'jsx': ['eslint','flow'],
\    'typescript.tsx': ['tslint', 'tsserver', 'typecheck']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'jsx': ['eslint', 'flow'],
\   'typescript.tsx': ['tslint']
\}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_sign_column_always = 1

"----------------------------------------------
" Plugin: bling/vim-airline
"----------------------------------------------
let g:airline_theme='one'

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1
" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
map <C-n> :NERDTreeToggle<CR>

" Files to ignore
let NERDTreeIgnore = [
\  '^node_modules[[dir]]'
\]

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
let g:deoplete#enable_at_startup = 1

"----------------------------------------------
" Plugin: Shougo/neosnippet
"----------------------------------------------
let g:neosnippet#enable_completed_snippet = 1

"----------------------------------------------
" Plugin: mattn/emmet-vim
"----------------------------------------------
let g:user_emmet_settings = {
\  'javascript' : {
\     'extends': 'jsx',
\     'quote_char': '"',
\  },
\  'typescript' : {
\    'extends': 'jsx',
\    'quote_char': '"',
\  }
\}

"----------------------------------------------
" Plugin: alvan/vim-closetag
"----------------------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'

" Terminal Cursor
if has ('nvim')
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg='#c678dd' guifg=white ctermbg=1 ctermfg=15
endif

" Switching pane
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
if has ('nvim')
    tnoremap <M-h> <c-\><c-n><c-w>h
    tnoremap <M-j> <c-\><c-n><c-w>j
    tnoremap <M-k> <c-\><c-n><c-w>k
    tnoremap <M-l> <c-\><c-n><c-w>l
endif

" Close typescript preview screen
set completeopt-=preview

" Allow JSX syntax in JS files
let g:jsx_ext_required = 0
