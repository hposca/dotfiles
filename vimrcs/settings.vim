""""""""""""""""""""""
" Custom Configuration
""""""""""""""""""""""

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" https://vim.fandom.com/wiki/Fix_syntax_highlighting
" https://stackoverflow.com/questions/8674387/vim-how-to-reload-syntax-highlighting
autocmd BufEnter,InsertLeave * :syntax sync fromstart
highlight CursorLine guibg=#303000 ctermbg=234

" kj as ESC
inoremap kj <esc>
cnoremap kj <esc>

" Map jk to always advance a screen line
nnoremap j gj
nnoremap k gk

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Convenient copy & paste into system clipboard
noremap <leader>Y "+y
noremap <leader>P "+p

" Insert date and time at current line
" nmap <silent> <leader>d "=strftime('%F %H:%M')<CR>Po<esc>

" Ctrl J/K add blank lines above and below
nnoremap <C-j> m`o<Esc>``
nnoremap <C-k> m`O<Esc>``

" <leader>x to close current buffer
nmap <silent> <leader>x :bd<CR>
" <leader>a to closse all buffers
nmap <silent> <leader>a :bufdo! bd<CR>

" Copy current filename into paste buffer
" :echo expand("%:p")    " absolute path
" :echo expand("%:p:h")  " absolute path dirname
" :echo expand("%:p:h:h")" absolute path dirname dirname
" :echo expand("%:.")    " relative path
" :echo expand("%:.:h")  " relative path dirname
" :echo expand("%:.:h:h")" relative path dirname dirname
nmap <silent> <leader>p :let @+ = expand('%:p')<CR>

" Tagbar Toggle
nmap <silent> <leader>t :TagbarToggle<CR>

" Format JSON
map <Leader>j !jq '.'<CR>

" Fix common typos in command mode
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang W w<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>

" Easily move between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
" Help from http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %

set number          " Show line numbers
set numberwidth=5
set ignorecase      " Ignore case while searching
set smartcase       " If you search with all lower case letters the search will be case insensitive.
set infercase       " If you type any upper case letter the search will be case sensitive
set smartindent     " Indent really smartly
set tabstop=2       " Configure tabs to two spaces
set softtabstop=2   " Configure tabs to two spaces
set shiftwidth=2    " Configure tabs to two spaces
set shiftround      " Configure tabs to two spaces
set expandtab       " Insert white spaces when you press tab
set wrap            " Break lines wider than the window width

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class " Extensions to ignore when autocompleting
set title                " change the terminal's title
set noerrorbells         " don't beep

set nobackup   " Don't create swap files
set noswapfile " Don't create swap files

set undofile
set undodir=$HOME/.vim/undo
silent !mkdir $HOME/.vim/undo > /dev/null 2>&1
set undolevels=1000
set undoreload=10000

" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·,extends:#
" set listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶
" set listchars=tab:→\ ,trail:␣,extends:…,eol:⏎
" set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬
" set listchars=tab:>-,trail:.,precedes:<,extends:>,eol:$
set listchars=tab:→\ ,trail:␣,extends:…,eol:$,space:.

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

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" Automatically removes all trailing whitespace when saving
augroup BeforeExit
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup end

" Specific files configuration
au FileType markdown setlocal ts=4 sts=4 sw=4

"""""""""""""""
" Colorscheme "
"""""""""""""""
let g:seoul256_background = 236
let g:seoul256_srgb = 1
colorscheme seoul256
" autocmd ColorScheme janah highlight Normal ctermbg=235
" colorscheme janah
set background=dark

"""""""""""""""""""""""""""""""
" Terminal mode configuration "
"""""""""""""""""""""""""""""""

" To map <Esc> to exit terminal-mode:
:tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""
" Quick window movements "
""""""""""""""""""""""""""
" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

"""""""""""""""""""""""""""""
" Pandoc specific shortcuts "
"""""""""""""""""""""""""""""
" Convert markdown to html directly into the paste buffer
" Thanks to
" - https://vi.stackexchange.com/questions/5835/how-to-run-bash-command-over-current-file-and-replace-buffer-with-result#answer-5837
" - https://superuser.com/questions/134148/mapping-a-piped-shell-command-in-vim#answer-134159
" - https://stackoverflow.com/questions/26071935/how-to-ignore-error-in-vim-key-mapping-command-series#answer-26073091
nnoremap <F9> :silent ! pandoc % -f markdown -t html \| xclip -selection clipboard<CR>

" Correcting spelling mistakes on the fly
" [How I'm able to take notes in mathematics lectures using LaTeX and Vim | Gilles Castel](https://castel.dev/post/lecture-notes-1/)
autocmd Filetype markdown,gitcommit call FixableSpellings()
function FixableSpellings()
  autocmd!
  setlocal spell
  set spelllang=en_ca
  inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u
endfunction
