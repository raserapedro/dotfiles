set nocompatible    " required, because it messes with other configs
filetype off        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'ntpeters/vim-better-whitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Direction in which to create new splits
set splitbelow
set splitright

" Write files, even when you forgot to sudo (use w!!)
cmap w!! w !sudo tee % >/dev/null

" Make backspace great again
set backspace=2

" Hidden, which basically hides buffers instead of closing them
set hidden

" Highligh search items
set hlsearch

" Ignore case when searching
set ignorecase

" When searching, try to be smart about cases
set smartcase

" Show search matches as you type
set incsearch

" Set command history size
set history=1000

" Tons of undos, just for you
set undolevels=1000

" Turn on the WiLd menu
set wildmenu

" Height of the command bar
set cmdheight=2

" When scrolling, always show 7 lines above/below cursor
set scrolloff=7

" Always show status line
set laststatus=2

" Show visual ruler at 80
set colorcolumn=80

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Wrap lines
set wrap

" No backup files
set nobackup
" No swap files
set noswapfile

" Enable syntax highlighting for Python
"let python_highlight_all=1

" Enable syntax highlighting
syntax enable

" For regular expressions turn magic on
set magic

" Set encoding to something decent
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix

" Line numbering
set number

" Add a bit extra margin to the left
set foldcolumn=1

" Ruler (good to know which column you're in)
set ruler

" Highlight current line
set cursorline

" Update file when it is changed outside of Vim
set autoread

" Lazy redraw
set lazyredraw

" COLORS AND FONTS
" Enable 256-color palette

" Truecolor support
set termguicolors

if $COLORTERM == 'xterm-256color'
	set t_Co=256
endif

set background=dark

try
	colorscheme badwolf
catch
endtry

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGS
" Syntastic
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" vim-gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'

" Ignore files in NERDTree
let NERDTreeIgnore = ['\.pyc$', '\~$']

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" END OF PLUGIN CONFIGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY (RE)MAPPINGS

" Change mapleader from \ to ,
let mapleader = ","

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fast saving
nmap <LEADER>w :w!<CR>

" Fast close
nmap <LEADER>q :q<CR>

" Edit .vimrc
nnoremap <LEADER>ev :vsp $MYVIMRC<CR>

" Source .vimrc
nnoremap <LEADER>sv :source $MYVIMRC<CR>

" Remap ESC to jk and JK
inoremap jk <ESC>
inoremap JK <ESC>

" fzf key mapping
map <C-t> :FZF<CR>

" NERDTree mapping
map <C-n> :NERDTreeToggle<CR>

" Clear search highlighting (press ,/)
nmap <silent> <LEADER><CR> :nohlsearch<CR>

" 'Paste mode', for pasting big chunks of code
set pastetoggle=<F2>

" Use ,rn to toggle relativenumber
map <LEADER>rn :set relativenumber!<CR>

" END OF KEY (RE)MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS

" END OF FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python - virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


filetype plugin indent on    " required
