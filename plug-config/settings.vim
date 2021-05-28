syntax enable
set number          " Show line numbers
set numberwidth=3
set ignorecase      " Ignore case while searching
set smartcase       " If you search with all lower case letters the search will be case insensitive.
set infercase       " If you type any upper case letter the search will be case sensitive
set smartindent     " Indent really smartly
set autoindent      " Good auto indent

set tabstop=2      " Insert 2 spaces for a tab
set shiftwidth=2   " Change the number of space characters inserted for indentation
set softtabstop=2  " Configure tabs to two spaces
set shiftround     " Configure tabs to two spaces
set expandtab      " Converts tabs to spaces
set smarttab       " Makes tabbing smarter will realize you have 2 vs 4
set showtabline=2  " Always show tabs

set wrap            " Break lines wider than the window width

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class " Extensions to ignore when autocompleting
set title                " change the terminal's title
set noerrorbells         " don't beep

set nobackup      " Don't create swap files
set noswapfile    " Don't create swap files
set nowritebackup " This is recommended by coc

set undofile
set undodir=$HOME/.vim/undo
silent !mkdir $HOME/.vim/undo > /dev/null 2>&1
set undolevels=1000
set undoreload=10000

set iskeyword+=-           " treat dash separated words as a word text object"
set formatoptions-=cro     " Stop newline continution of comments
set whichwrap+=<,>,[,],h,l

set hidden                 " Required to keep multiple buffers open multiple buffers
set encoding=utf-8         " The encoding displayed
set fileencoding=utf-8     " The encoding written to file
set pumheight=10           " Makes popup menu smaller
set ruler              		 " Show the cursor position all the time
" set cmdheight=2            " More space for displaying messages
set mouse=a                " Enable your mouse

set splitbelow             " Horizontal splits will automatically be below
set splitright             " Vertical splits will automatically be to the right

" set conceallevel=0         " So that I can see `` in markdown files
set laststatus=2           " Always display the status line
set shortmess+=c           " Don't pass messages to |ins-completion-menu|.
" set signcolumn=yes         " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=100         " Faster completion
" set clipboard=unnamedplus  " Copy paste between vim and everything else
set incsearch              " Incremental search

"""""""""""""""
" Colorscheme "
"""""""""""""""
set t_Co=256                    " Support 256 colors
let g:seoul256_background = 236
let g:seoul256_srgb = 1
colorscheme seoul256
set background=dark             " tell vim what the background color looks like

"""""""""""""""""""""""
" Visual Improvements "
"""""""""""""""""""""""
" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·,extends:#
" set listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶
" set listchars=tab:→\ ,trail:␣,extends:…,eol:⏎
" set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬
" set listchars=tab:>-,trail:.,precedes:<,extends:>,eol:$
set listchars=tab:→\ ,trail:␣,extends:…,eol:$,space:.

" Highlight the screen line of the cursor
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

""""""""""""""""""""""""""""""""
" Quality of Life Improvements "
""""""""""""""""""""""""""""""""

" Fix common typos in command mode
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang W w<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>

" Automatically removes all trailing whitespace when saving
augroup BeforeExit
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup end

" Correcting spelling mistakes on the fly
" [How I'm able to take notes in mathematics lectures using LaTeX and Vim | Gilles Castel](https://castel.dev/post/lecture-notes-1/)
autocmd Filetype markdown call FixableSpellings()
function FixableSpellings()
  " autocmd!
  setlocal spell
  set spelllang=en_ca
  inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u
endfunction
