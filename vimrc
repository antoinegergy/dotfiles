let mapleader = ","
set shell=bash

" Plugins plugins plugins (plugins ?)
call plug#begin("~/.vim_plugins")

" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
" Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" Go development plugin for Vim
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'
" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'
" Docker syntax
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
" Use gcc to comment out a line
Plug 'tpope/vim-commentary'
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Vastly improved Javascript indentation and syntax support in Vim.
Plug 'pangloss/vim-javascript'
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'
" Generates config files for YouCompleteMe
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
" Color scheme
Plug '7fELF/vim-deus'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
" Dark powered asynchronous unite all interfaces for Neovim/Vim8
Plug 'Shougo/denite.nvim'
"  View and grep man pages in vim
Plug 'vim-utils/vim-man'
" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'
" Run bash in vim
" Plug 'oplatek/Conque-Shell'
" Delete buffers and close files in Vim without closing your windows or messing up your layout.
Plug 'moll/vim-bbye'
" Continuously updated session files
Plug 'tpope/vim-obsession'
" Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'
" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'
" UltiSnips - The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'
" Tame the quickfix window
Plug 'romainl/vim-qf'

" Typesript :(
Plug 'leafgarland/typescript-vim'

" Cuelang
Plug 'jjo/vim-cue'

call plug#end()

" Enable 256 colors
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Enable mouse
set mouse=a

" Colors
" let g:colors_name = "deus"
let g:colors_name = "gruvbox"
" let g:colors_name = "jellybeans"
" set termguicolors
set background=dark
let g:deus_termcolors=256
execute 'colorscheme ' . g:colors_name

"" Spell Checking
" set spell
" set spelllang=en

" Airline settings
"
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" disable displaying tabs, regardless of number.
let g:airline#extensions#tabline#show_tabs = 0

" Show just the filename
let g:airline#extensions#tabline#fnamemod = '%:.'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_theme=g:colors_name

" GVim
"
" font
set guifont=Hack\ 11
"remove menu bar
set guioptions-=m
"remove toolbar
set guioptions-=T
"remove right-hand scroll bar
set guioptions-=r
"remove left-hand scroll bar
set guioptions-=L

filetype plugin indent on
syntax on

" Fix C compound literals
" https://github.com/vim/vim/issues/406
let c_no_curly_error = 1

nnoremap <Leader>k  :Denite buffer directory_rec file_rec file_point<CR>

"Remap undo and redo to Ctrl-Z and Ctrl-Y
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>

" remap arrow keys
noremap <Down> gj
noremap <Up> gk

" copy
vnoremap <C-c> "+y

" search remap
nnoremap / /\v
nnoremap ; :
vnoremap // y/<C-R>"<CR>

nnoremap <Leader>t :Tagbar<CR>

"number of forgivable mistakes
set undolevels=1000

"Show line numbers, relative to the cursor position
set relativenumber
"Show the absolute line number at the cursor position
set number
set noshowmode

let g:epitech_header = 1
let g:epitech_dont_update_header = 1

set nocompatible
filetype off

" clear search
nnoremap <leader><space> :noh<cr>

map <C-n> :NERDTreeToggle<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-b>"

filetype plugin indent on

" Go Highlight
let g:go_highlight_functions = 0
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 0

" YCM
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" disable the default mapping of vim-go
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"

" Auto save befor running :make or :GoBuild
set autowrite

" https://github.com/fatih/vim-go-tutorial#vimrc-improvements
let g:go_list_type = "quickfix"
nnoremap <C-m> :cnext<CR>
nnoremap <S-M> :cprevious<CR>
nnoremap <leader>n :cclose<CR>



let g:go_guru_scope = ["."]
let g:go_auto_sameids = 1

autocmd filetype go noremap <Leader>gd :GoDef<CR>
autocmd filetype go noremap <Leader>gt :GoDefPop<CR>
autocmd filetype go noremap <Leader>gf :GoDoc<CR>
autocmd filetype go noremap <Leader>gr :GoImplements<CR>
autocmd filetype go noremap <Leader>gc :GoCallers<CR>
autocmd filetype go noremap <Leader>gb :GoFill<CR>
autocmd filetype go noremap <Leader>ge :GoIfErr<CR>
autocmd filetype go noremap <Leader>gk :GoKeyify<CR>
autocmd filetype go noremap <Leader>j :GoDecls<CR>
autocmd filetype go noremap <Leader>i :GoDeclsDir<CR>
autocmd filetype go nmap <leader>b  <Plug>(go-build)
autocmd filetype go nnoremap <leader><space> :noh<cr>:GoSameIdsClear<cr>

" show the type info (|:GoInfo|) for the word under the cursor automatically
let g:go_auto_type_info = 1
set updatetime=100
" let g:go_info_mode = 'guru'
let g:go_info_mode = 'gocode'

" Auto lint on save
let g:qf_auto_open_quickfix = 0
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_jump_to_error = 0

set modelines=0
syntax enable
set nu
set ruler

set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png

let g:ale_sign_column_always = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '💡'

let g:ale_linters = {
	\ 'go': ['gopls'],
	\}

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set ttyfast
set backspace=indent,eol,start
set cursorline


"Custom settings
set nofoldenable    " disable folding
let g:vim_markdown_folding_disabled=1

" Use case insensitive search except when using capital letters
set ignorecase
set smartcase

set gdefault
set incsearch
set showmatch
set hlsearch

" match the next brace
nnoremap <tab> %
vnoremap <tab> %
set wrap
set formatoptions=qrn1
set linebreak

" remap movement to move by column layout
nnoremap j gj
nnoremap k gk

" Strips whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Select pasted text
nnoremap <leader>v V`]

"Window splitting remap
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>q <C-w>s<C-w>j

"Move into splitted windows
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Windows
nnoremap <leader>T :enew<cr>
nnoremap fr :tabnext<CR>
nnoremap ft :tabprevious<cr>
nnoremap fd :q<cr>

" Buffers
nnoremap gt :bnext<CR>
nnoremap gr :bprevious<cr>
" Bdelete is a command from moll/vim-bbye
nnoremap gd :Bdelete<cr>

" Vimrc shortcuts
nnoremap <leader>vi :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" wrap whatever text you have visually selected in quotes
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

" Arrow keys
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" nnoremap <up> <nop>
" nnoremap <down> <nop>

"inoremap <left> <nop>
"inoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>


augroup file_types
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.txt set filetype=markdown
    autocmd BufRead,BufNewFile *.less set filetype=less
    autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
    autocmd BufRead,BufNewFile *.ts set ft=typescript syntax=typescript
    autocmd BufRead,BufNewFile *.es6 set ft=javascript syntax=javascript
    autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
    autocmd BufRead,BufNewFile *.twig set ft=htmldjango
    autocmd BufRead,BufNewFile *.rabl set ft=ruby
    autocmd BufRead,BufNewFile *.jade set ft=jade
augroup END

" Whitespace fixes
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

augroup whitespace
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

set title

set noerrorbells
set noswapfile
set nobackup

" Paste mode
set pastetoggle=<leader>p

set fileformat=unix
set fileformats=unix,dos

"disable visual bells
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" preserve clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [ 'p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types', 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor', 'f:functions' ],
      \ 'sro' : '.',
      \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
      \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

