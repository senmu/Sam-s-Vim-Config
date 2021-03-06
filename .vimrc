if has("win32") 
    set runtimepath=~/gvim/Sam-s-Vim-Config/.vim,$VIMRUNTIME,~/gvim/Sam-s-Vim-Config/.vim/after
endif
" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Appearance
set background=dark
set t_Co=256 " 256 colors in terminal

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
set textwidth=80

" Highlight column 81 and onward (signifying that 80 is the last valid column)
if exists('+colorcolumn')
    " (I picked 120-320 because you have to provide an upper bound and 500
    " seems to be enough.)
    let &colorcolumn="80,".join(range(120,500),",")
else
    " fallback for Vim < v7.3
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

set grepprg=grep\ -nH\ $*

" Trying out the line numbering thing... never liked it, but that doesn't mean
" I shouldn't give it another go :)
set number
" set relativenumber

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" Replace word with contents of paste buffer (mnemoic for the key sequence is
" 'c'hange 'p'aste)
nmap <silent> cp "_ciw<C-R>"<Esc>

" Allow the use of <esc> to cancel last search highlight
" nnoremap <silent> <esc> :noh<return><esc>

" Set up =j keystroke to pretty-print json
nmap <silent> =j :%!python -m json.tool<CR>

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Make command line two lines high
set ch=2
"
" set visual bell -- I hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=gmace

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
set complete=.,w,b,t

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Change the leader key to ','
let mapleader=","

" Change tab size to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Create an undo file to maintain history between sessions
set undofile
" Use one, common directory to store all undo history files, rather than the
" same directory as the file that's currently being edited
set undodir=~/.vim/undodir

" Set the font to Monaco, 12pt
" set guifont=Monaco:h12
if has("mac")
	"set noantialias
	"set guifont=Terminus\ (TTF):h12
	"set guifont=Menlo:h14
    set guifont=Menlo\ for\ Powerline:h12
    let g:airline_powerline_fonts = 1
	"set transparency=15
elseif has("win32")
    set encoding=utf-8
    set guifont=Consolas_for_Powerline_FixedD:h9
    let g:airline_symbols = {}
    let g:airline_left_sep = "\u2b80" "use double quotes here
    let g:airline_left_alt_sep = "\u2b81"
    let g:airline_right_sep = "\u2b82"
    let g:airline_right_alt_sep = "\u2b83"
    let g:airline_symbols.branch = "\u2b60"
    let g:airline_symbols.readonly = "\u2b64"
    let g:airline_symbols.linenr = "\u2b61"
else
	set guifont=Terminus\ 8
endif

" Set colorscheme to onedark
colorscheme onedark

" Allow navigating between starting and ending HTML tags with '%'
runtime macros/matchit.vim

" Airline config
let g:airline#extensions#tabline#enabled = 1

call pathogen#infect()

" Set custom highlight color for columns 81 and onward
highlight ColorColumn ctermbg=246 guibg=#2d2d2d

