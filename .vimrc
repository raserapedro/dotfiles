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
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'

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

" Show search matches as you type
set incsearch

" Set command history size
set history=1000

" Tons of undos, just for you
set undolevels=1000

" Change the terminal's title
set title

" Height of the command bar
set cmdheight=2

" When scrolling, always show 7 lines above/below cursor
set scrolloff=7

" Always show status line
set laststatus=2

" Wrap lines
set wrap

" No backup files
set nobackup
" No swap files
set noswapfile

" Enable syntax highlighting for Python
let python_highlight_all=1
syntax on

" Set encoding to something decent
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix

" C O L O R S B O I S ! !
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

" Switch between background colors
call togglebg#map("<F5>")

" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Line numbering
set number

" Ruler (good to know which column you're in)
set ruler

" Highlight current line
set cursorline

" Update file when it is changed outside of Vim
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGS
" Syntastic
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

" END OF PLUING CONFIGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY (RE)MAPPINGS

" Change mapleader from \ to ,
let mapleader=","

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Edit .vimrc
nnoremap <LEADER>ev :vsp $MYVIMRC<CR>

" Source .vimrc
nnoremap <LEADER>sv :source $MYVIMRC<CR>

" Remap ESC to jk
inoremap jk <ESC>

" fzf key mapping 
map <C-t> :FZF<CR>

" Clear search highlighting (press ,/)
nmap <silent> ,/ :nohlsearch<CR>

" 'Paste mode', for pasting big chunks of code
set pastetoggle=<F2>

" Use ,rn to toggle relativenumber
map <leader>rn :set relativenumber!<CR>

" END OF KEY (RE)MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS

" END OF FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


filetype plugin indent on    " required
