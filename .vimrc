set nocompatible

" set hlsearch
" set diffopt+=iwhite

set expandtab
set shiftwidth=4
set tabstop=4
set showmatch
set nojoinspaces
set printoptions+=formfeed:y

" Enable right-click copy, paste etc. menu.
set mousemodel=popup

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" allow the left and right arrow keys to continue past the start and end of lines
set whichwrap+=<,>,[,]

set history=128
set ruler  " show the cursor position all the time
set showcmd  " display incomplete commands
set incsearch  " do incremental searching

if has("gui_running")
    set background=light
    " Disable blink
    set guicursor=n:blinkon0
else
    " Set to `light` or `dark` via `.bashrc`.
    " Note: `let` is a more powerful form of `set`, `set` can only work with literals.
    " See https://learnvimscriptthehardway.stevelosh.com/chapters/19.html
    let &background = $VIM_TERMINAL_BG
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Turn on filetype based indenting.
filetype plugin indent on

" Set :help last-position-jump - restore last cursor position.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Mark Vimball plugin as already loaded to disable it and enable editing .vba files.
let g:loaded_vimballPlugin = "X"

" https://github.com/jtratner/vim-flavored-markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
 
" Disable any textwidth settings made by plugins.
autocmd VimEnter * :set textwidth=0
 
" Find out what script set a setting:
" :verbose set tw
"
" See order in which scripts ran:
" :scriptnames
"
" The file type plugins are run after ~/.vimrc, VimEnter allows you to
" specify that something is run after all startup has completed.
