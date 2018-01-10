let mapleader = ","

" To install vim-plug:
" $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
Plug 'tpope/vim-sensible'             " Sensible vim defaults

Plug 'junegunn/seoul256.vim'          " Colorscheme
Plug 'vim-airline/vim-airline'        " Powerline like statusline
Plug 'vim-airline/vim-airline-themes' " Airline themes

" Generic edition improvements
Plug 'andrewradev/switch.vim'         " Switch segments of text with predefined replacements
Plug 'beloglazov/vim-online-thesaurus' " An online thesaurus
Plug 'christoomey/vim-tmux-navigator' " Vim integration with Tmux
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/vim-cursorword'         " Underlines the word under the cursor
Plug 'junegunn/rainbow_parentheses.vim' " Colored Parenthesis
Plug 'mhinz/vim-grepper'              " Use your favorite grep tool to start an asynchronous search
Plug 'plasticboy/vim-markdown', {'for': 'markdown'} " Markdown vim mode
Plug 'raimondi/delimitmate'           " Auto-completion for quotes, parens, brackets
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'            " Comment like a boss
Plug 'tpope/vim-surround'             " Ease surrounding

" Git integration
Plug 'tpope/vim-fugitive'             " Git integration inside vim
Plug 'junegunn/gv.vim'                " A git commit browser

" Programming specific
Plug 'tpope/vim-rails'                " Ruby on Rails Power tools from Tim Pope
Plug 'vim-ruby/vim-ruby'              " Ruby on Rails Power tools from Tim Pope
Plug 'tpope/vim-endwise'              " wisely add 'end' in ruby
Plug 'ecomba/vim-ruby-refactoring'    " Ruby Refactoring Tool for Vim

" Better AutoCompletion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'hashivim/vim-terraform'         " Terraform manipulation in Vim
Plug 'hposca/ultisnips-terraform-snippets'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'     " Deoplete for Ruby

call plug#end()

""""""""""""""""""""""
" Custom Configuration
""""""""""""""""""""""

" kj as ESC
inoremap kj <esc>
cnoremap kj <esc>

" Map jk to always advance a screen line
nnoremap j gj
nnoremap k gk

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Ctrl J/K add blank lines above and below
nnoremap <C-j> m`o<Esc>``
nnoremap <C-k> m`O<Esc>``

" <leader>x to close current buffer
nmap <silent> <leader>x :bd<CR>
" <leader>a to closse all buffers
nmap <silent> <leader>a :bufdo! bd<CR>

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
set list listchars=tab:»·,trail:·,nbsp:·

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

""""""""""""""""""""""""""""""""""
" Specific Plugins Configuration "
""""""""""""""""""""""""""""""""""

" NERDTree
""""""""""

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> :NERDTreeFind<CR>

" airline
"""""""""

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'
let g:airline_enable_branch = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Allows to change to buffers using leader + number
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tabmode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" tmux-navigator
""""""""""""""""

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

" CtrlP
"""""""

nnoremap <leader>b :CtrlPBuffer<cr>

" TComment
""""""""""

" ,c toggles comment (Tcomment)
nmap <silent> <leader>c :TComment<CR>
vmap <silent> <leader>c :TComment<CR>

" Terraform
"""""""""""
let g:terraform_fmt_on_save = 1
autocmd BufNewFile,BufRead *.tf set ft=terraform

" Grepper
"""""""""

runtime plugin/grepper.vim
nnoremap K :Grepper <cr>
nnoremap <leader>* :Grepper -tool git -open -switch -cword -noprompt<cr>

let g:grepper.highlight = 1
let g:grepper.dir = 'repo,file,cwd'
let g:grepper.rg.grepprg .= ' --smart-case'

" Deoplete
""""""""""

let g:deoplete#enable_at_startup = 1

" UltiSnips
"""""""""""

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Switch
""""""""
let g:switch_mapping = "-"

" vim-markdown
""""""""""""""
let g:vim_markdown_folding_disabled = 1

"  RainbowParenthesis
"""""""""""""""""""""

augroup rainbow
  autocmd!
  autocmd FileType * RainbowParentheses
augroup END

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]

"""""""""
" Hints "
"""""""""
" How to see all mapped keys
" :nmap for normal mode mappings
" :vmap for visual mode mappings
" :imap for insert mode mappings
" :mkexrc Write current key mappings and changed options to [file]
