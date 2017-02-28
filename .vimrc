set nocompatible    " required, because it messes with other configs
filetype off        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Direction in which to create new splits
set splitbelow
set splitright

" KEY (RE)MAPPINGS
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Change mapleader from \ to ,
let mapleader=","

" fzf key mapping 
map <C-t> :FZF<CR>

" 'Paste mode', for pasting big chunks of code
set pastetoggle=<F2>

" Write files, even when you forgot to sudo (use w!!)
cmap w!! w !sudo tee % >/dev/null

" Make backspace great again
set backspace=2

" Hidden, which basically hides buffers instead of closing them
set hidden

" Highligh search items
set hlsearch

" Show search matches as you type
set incsearch

" Clear search highlighting (press ,/)
nmap <silent> ,/ :nohlsearch<CR>

" Set command history size
set history=1000

" Tons of undos, just for you
set undolevels=1000

" Change the terminal's title
set title

" No backup files
set nobackup
" No swap files
set noswapfile

" Enable syntax highlighting for Python
let python_highlight_all=1
syntax on

" Set encoding to something decent
set encoding=utf-8

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

" PLUGIN CONFIGS!
" Syntastic
set statusline+=%#Warningmsg#
set statusline+={SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Line numbering
set nu

" Ruler (good to know which column you're in)
set ruler

filetype plugin indent on    " required
