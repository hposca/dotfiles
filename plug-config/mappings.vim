" Space as Leader Key
let mapleader="\<Space>"
nnoremap <Space> <Nop>

""""""""""""""
" Remappings "
""""""""""""""
" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
" xnoremap K :move '<-2<CR>gv-gv
" xnoremap J :move '>+1<CR>gv-gv

" kj as ESC
inoremap kj <esc>
cnoremap kj <esc>

" Map jk to always advance a screen line
nnoremap j gj
nnoremap k gk

" " Better indenting
" vnoremap < <gv
" vnoremap > >gv

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Ctrl J/K add blank lines above and below
nnoremap <C-j> m`o<Esc>``
nnoremap <C-k> m`O<Esc>``

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Easily move between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"
" Easily move between tabs
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tabfirst<CR>
nnoremap <silent> ]T :tablast<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
" Help from http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

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
