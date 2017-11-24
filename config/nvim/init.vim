set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'Shougo/neocomplcache'

" Essentials
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'dag/vim-fish'
Plug 'mattn/emmet-vim'
Plug 'roman/golden-ratio'
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rbgrouleff/bclose.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'

" Linting
Plug 'w0rp/ale'

" Ctags
Plug 'mmorearty/elixir-ctags'

" Navigation
Plug 'ctrlpvim/ctrlp.vim'

" Airline
Plug 'enricobacis/vim-airline-clock'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tools
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim'
Plug 'trevordmiller/nova-vim'

" Languages Support
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug 'mhartington/nvim-typescript',       { 'do': ':UpdateRemotePlugins' }
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/html5.vim',                  { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'slashmili/alchemist.vim'
Plug 'mhartington/deoplete-typescript', { 'do': 'npm install -g typescript', 'for': 'typescript' }

" Phoenix
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'

" AutoComplete
Plug 'mhartington/nvim-typescript'
Plug 'wokalski/autocomplete-flow'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'ervandew/supertab'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set shell=zsh
set encoding=utf-8
set autoindent
set smartindent
set autoread
set colorcolumn=81
set cursorcolumn
set cursorline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list
set list listchars=tab:»\ ,trail:·
set nospell
set noswapfile
set nowrap
set noerrorbells
set number
set numberwidth=5
set relativenumber
set ruler
set textwidth=80
set title
set updatetime=100
set scrolloff=5
set backspace=indent,eol,start
set t_Co=256

let mapleader = ','

" Clear search hightlights
map <leader>c :nohlsearch<cr>

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

" Allow vim to set a custom font or color for a word
syntax enable

"----------------------------------------------
" Colors
"----------------------------------------------
set background=dark
" colorscheme PaperColor
colorscheme onedark
set termguicolors

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch
set hlsearch

" Override the search highlight color with a combination that is easier to
" read. The default PaperColor is dark green backgroun with black foreground.
"
" Reference:
" - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White

" Fuzzy finder ignore file
set wildignore=*.gif,*.png,*.jpg,*/node_modules,*/build,*/deps,*/_build

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" neosnippet
let g:neosnippet#enable_completed_snippet = 1

" Close typescript preview screen
set completeopt-=preview

" Golang Syntax
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

" Show type information
let g:go_auto_type_info = 1

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'errcheck',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
    \]

au FileType go nmap gtd <Plug>(go-def)

" Transform struct element for json
let g:go_addtags_transform = "snakecase"
"----------------------------------------------
" Plugin: w0rp/ale
"----------------------------------------------
" Wait before linting when typing
let g:ale_lint_delay = 4000
" Provided linter for specific language
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['tslint']
\}
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescript': ['tslint']
\}
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

augroup AleGroup
    autocmd!
    autocmd User ALELint call TouchOpenFile()
augroup END

func! TouchOpenFile()
    let g:ale_enabled = 0
    sleep 500m
    w
    let g:ale_enabled = 1
endfunc

"----------------------------------------------
" Plugin: ludovicchabant/vim-gutentags
"----------------------------------------------
let g:gutentags_cache_dir = '~/.tags_cache'

"----------------------------------------------
" Plugin: bling/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2
let g:airline_theme='onedark'

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

" Explicitly define some symbols that did not work well for me in Linux.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" let g:airline_symbols.branch = ''
" let g:airline_symbols.maxlinenr = ''

let g:tsuquyomi_completion_detail = 1

let g:airline#extensions#ale#enabled = 1

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

"----------------------------------------------
" Plugin: plasticboy/vim-markdown
"----------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

"----------------------------------------------
" Plugin: zchee/deoplete-go
"----------------------------------------------
" Enable completing of go pointers
let g:deoplete#sources#go#pointer = 1

"----------------------------------------------
" Plugin: ctrlpvim/ctrlp.vim
"----------------------------------------------
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build)|(\.(swp|ico|git|svn|png|jpg|lock))$'

"----------------------------------------------
" Plugin: rbgrouleff/bclose.vim
"----------------------------------------------
" Close buffers
nnoremap <leader>w :Bclose<cr>

" CloseTag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends': 'jsx',
\      'quote_char': '"',
\  },
\  'typescript' : {
\	'extends': 'jsx',
\	'quote_char': '"',
\  }
\}

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2


"----------------------------------------------
" Language: GOLANG
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

" Elixir Tagbar Configuration
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

" Golang Tagbar Configuration
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

""""""""""""""""""""""
" Mapping Configuration
""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" if (empty($TMUX))
"   if (has("nvim"))
"     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif
"
" let g:onedark_termcolors = 16

" let g:python_host_prog  = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'

let g:javascript_plugin_flow = 1

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Setup Terminal Colors For Neovim {{{
" if has('nvim')
"   " dark0 + gray
"   let g:terminal_color_0 = "#282828"
"   let g:terminal_color_8 = "#928374"
"
"   " neurtral_red + bright_red
"   let g:terminal_color_1 = "#cc241d"
"   let g:terminal_color_9 = "#fb4934"
"
"   " neutral_green + bright_green
"   let g:terminal_color_2 = "#98971a"
"   let g:terminal_color_10 = "#b8bb26"
"
"   " neutral_yellow + bright_yellow
"   let g:terminal_color_3 = "#d79921"
"   let g:terminal_color_11 = "#fabd2f"
"
"   " neutral_blue + bright_blue
"   let g:terminal_color_4 = "#458588"
"   let g:terminal_color_12 = "#83a598"
"
"   " neutral_purple + bright_purple
"   let g:terminal_color_5 = "#b16286"
"   let g:terminal_color_13 = "#d3869b"
"
"   " neutral_aqua + faded_aqua
"   let g:terminal_color_6 = "#689d6a"
"   let g:terminal_color_14 = "#8ec07c"
"
"   " light4 + light1
"   let g:terminal_color_7 = "#a89984"
"   let g:terminal_color_15 = "#ebdbb2"
" endif " }}}
