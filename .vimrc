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
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'

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

" Colorscheme
colorscheme gruvbox

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

" vim-gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

" gruvbox
let g:gruvbox_contrast_dark='dark'
let g:gruvbox_hls_cursor='gray'
let g:gruvbox_italic=1
let g:gruvbox_improved_strings=1

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#fnamemod=':t'

" END OF PLUGIN CONFIGS
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
