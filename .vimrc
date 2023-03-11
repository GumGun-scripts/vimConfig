set t_Co=256
set nocompatible

"cursor appearance
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
    au!
    autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

augroup cursorApp
    au!
    autocmd FocusGained * silent !echo -ne "\e[2 q"
augroup END

autocmd BufWinLeave * silent !echo -ne "\e[2 q"


:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

set hid
set path+=**
set wildmenu
set wildignore="./tags"
set confirm

            "identation and format 
set showmatch " Shows matching brackets
set autoindent " Autotabs for certain code

set cursorline
set title
set nowrap "Wrap lines
set breakindent " indent after line wrapped"


set noswapfile
set directory=$HOME/.vim/swp//
set nobackup
set backupdir=$HOME/.vim/backups//
set undofile
set undodir=$HOME/.vim/undo//

            "timeouts
set timeoutlen=0
set ttimeoutlen=0

            "status line
set laststatus=2
set statusline=%F%m%r%h%W%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

            "Text rendering
syntax enable  " Syntax highlighting
set linebreak
set nu rnu 
set scrolloff=1
set sidescroll=5


set wildmenu
set showmode 
set backspace=indent,eol,start
set history=500
set autoread

" open file vertically to the right
augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call Netrw_mappings()
augroup END
function! OpenToRight()
  :rightbelow vnew
  :wincmd p
  :normal P
endfunction
function! Netrw_mappings()
    noremap V :call OpenToRight()<cr>
endfunction

            "color of things
highlight Comment ctermbg=none ctermfg=161
highlight visual ctermbg=236 ctermfg=none
highlight LineNr cterm=bold ctermbg=none ctermfg=69
highlight Normal ctermbg=none ctermfg=246
highlight StatusLine ctermbg=195 ctermfg=161



map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

            "nwtrw configs
let g:netrw_liststyle=3
let g:netrw_browse_split=0
let g:netrw_winsize=30
let g:netrw_banner=0
autocmd BufRead scp://* :set bt=acwrite


            "indentation pluggin config
let g:indentLine_color_term = 161
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']



            "plug control
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/Smart-Tabs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'kmyk/sdl2.vim'
Plug 'beyondmarc/opengl.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

            "custom keys
imap a <Esc>
map a <Esc>
cnoremap  a <c-c>

map <silent> w :w<CR>
map <silent> q :q<CR>
map <silent> e :stop<CR>
map <silent> s :copen<CR>
nnoremap <Tab> <C-w>


map v :so $MYVIMRC<CR>
map Y y$

map <silent> - :Ex<CR>
map <silent> - :b#<CR>

"let mapleader=" "
nnoremap <silent> <space> :b#<CR>

            "folds
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2 

let &tags = substitute(globpath('.helpers/tags/', '*.tags'), "\n", ',', 'g')

            " Configuration example
"map <F11> :FloatermNew<Space>vifm<CR>
"let g:floaterm_keymap_toggle      = '<F12>'

set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set cindent


