" Install NeoBundle first:
"   $ mkdir -p ~/.vim/bundle
"   $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"
" Put this vimrc file in .vim/vimrc

scriptencoding utf-8

set nocompatible
filetype off
let mapleader = ","

" NeoBundle (plugin manager) config
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

""""""""""""""
" Plugins list
""""""""""""""
NeoBundle 'tpope/vim-surround'            " Ease surrounding
NeoBundle 'honza/vim-snippets'            " The best snippet engine you'll ever need
NeoBundle 'sirver/ultisnips'
NeoBundle 'tomtom/tcomment_vim'           " Comment like a boss
NeoBundle 'raimondi/delimitmate'          " If you miss IDE features like character closing
NeoBundle 'tpope/vim-endwise'             " If you miss IDE features like block closing
NeoBundle 'ctrlpvim/ctrlp.vim'            " Fuzzyfinder, yes vim has and has more than one
NeoBundle 'scrooloose/nerdtree'           " A file explorer
NeoBundle 'othree/html5.vim'              " Improves vim html5 syntax and indentation
NeoBundle 'vim-scripts/HTML-AutoCloseTag' " Close tags automatically
NeoBundle 'tpope/vim-rails'               " If you use these plugins correctly you'll never
NeoBundle 'vim-ruby/vim-ruby'             " look for an IDE again
NeoBundle 'ecomba/vim-ruby-refactoring'   " IDE refactorings in Vim
NeoBundle 'drslump/vim-syntax-js'         " Improves vim js syntax and indentation
NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundle 'simnalamburt/vim-mundo'        " Vim undo tree visualizer
NeoBundle "vim-scripts/TaskList.vim"      " Better Organize your TODOs
NeoBundle 'tpope/vim-dispatch'            " Kick off builds and test suites
NeoBundle 'vim-airline/vim-airline'       " Powerline like statusline
NeoBundle 'vim-airline/vim-airline-themes' " Airline themes
NeoBundle 'trapd00r/neverland-vim-theme'  " Neverland colorscheme
NeoBundle 'morhetz/gruvbox'
NeoBundle 'junegunn/vim-easy-align'       " Easy alignment
NeoBundle 'majutsushi/tagbar'             " Tag bar
NeoBundle 'scrooloose/syntastic'          " Linter
NeoBundle 'rking/ag.vim'                  " The silver searcher
                                          " It needs a: sudo apt-get install -y silversearcher-ag
NeoBundle 'tpope/vim-fugitive'            " Git integration inside vim
NeoBundle 'junegunn/gv.vim'               " A git commit browser
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'      " Coffee Script Highlighting
NeoBundle 'digitaltoad/vim-jade'          " Jade Highlighting
NeoBundle 'ekalinin/Dockerfile.vim'       " Dockerfile highlighting
NeoBundle 'low-ghost/nerdtree-fugitive'   " Integração Nerdtree + vim-fugitive
                                          " At NERDTree hit 'm' then 'g'
NeoBundle 'beloglazov/vim-online-thesaurus' " An online thesaurus
NeoBundle 'slim-template/vim-slim'        " Slim highlighting
NeoBundle 'christoomey/vim-tmux-navigator' " Vim integration with Tmux
NeoBundle 'junegunn/rainbow_parentheses.vim' " Colored Parenthesis
NeoBundle 'terryma/vim-multiple-cursors'   " Multiple cursors
NeoBundle 'elzr/vim-json' " JSON Highlighting
NeoBundle 'hashivim/vim-terraform.git'
NeoBundle 'itchyny/vim-cursorword'
NeoBundle 'hposca/ultisnips-terraform-snippets'
NeoBundle 'mzlogin/vim-markdown-toc'
NeoBundle 'fatih/vim-hclfmt' " To install it, first: go get github.com/fatih/hclfmt
NeoBundle 'b4b4r07/vim-hcl'

""""""""""""""""""
" Python support "
""""""""""""""""""
" To install YouCompleteMe we need to configure the environment:
"   sudo apt-get update && sudo apt-get install -y build-essential cmake python-dev python3-dev
"   pip install --upgrade autopep8
" Then install it:
"   cd ~/.vim/bundle/YouCompleteMe
"   ./install.py
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'vim-scripts/indentpython.vim'

call neobundle#end()
filetype plugin indent on " required
syntax on                 " Enable syntax recognition
NeoBundleCheck            " Check if any bundle is not installed on startup

""""""""""""""
" Simple remap
""""""""""""""
" kj como ESC
ino kj <esc>
cno kj <c-c>

" Fix common typos in command mode
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang W w<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
" Allow saving of files as sudo when I forgot to start vim using sudo.
" Help from http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %

"""""""""""""
" Vim options
"""""""""""""
set number          " Show line numbers
set numberwidth=5
set ignorecase      " Ignore case while searching
set smartcase       " If you search with all lower case letters the search will be case insensitive.
set infercase       " If you type any upper case letter the search will be case sensitive
set hlsearch        " Highlight search term
set incsearch       " Go to the matching pattern while you type
set smartindent     " Indent really smartly
set tabstop=2       " Configure tabs to two spaces
set softtabstop=2   " Configure tabs to two spaces
set shiftwidth=2    " Configure tabs to two spaces
set shiftround      " Configure tabs to two spaces
set expandtab       " Insert white spaces when you press tab
set wildmenu        " zsh like menu
set wildmode=full   " zsh like menu
set wrap            " Break lines wider than the window width
set nrformats=alpha " Increases/Decreases numbers with Ctrl-a/Ctrl-x correctrly
                    " Help from: http://www.slackorama.com/projects/vim/vimrc.html
set showcmd         " Show what command is being typed at the right corner
set ruler           " Show the cursor position all the time
set enc=utf-8       " UTF-8 encoding, by default

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

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a
set ttymouse=xterm2

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Insert only one space when joining lines
set nojoinspaces

" Disables automatically breaking lines with newlines
set formatoptions-=t

"================ Scrolling ========================

set scrolloff=4         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Always use vertical diffs
set diffopt+=vertical

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

"""""""""""""""""""""""""""""""""""""""
" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
"""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2> "F2 before pasting to preserve indentation

"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
" map <silent><C-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"

""""""""""""""""""""
" Tmux compatibility
""""""""""""""""""""
"tmux integration
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

" Made possible with the help of:
" http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

" Quicker window movement
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

""""""""""""""""""""""""""""
" Panes and windows resizing
""""""""""""""""""""""""""""
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"""""""""""""
" Colorscheme
"""""""""""""
set background=dark
colorscheme gruvbox

""""""""""""""""""""""""
"  RainbowParenthesis  "
""""""""""""""""""""""""
augroup rainbow_lisp
  autocmd!
  autocmd FileType * RainbowParentheses
augroup END

""""""""""""""""
" Python Editing
""""""""""""""""

" Jedi-vim

let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#popup_on_dot = 1
" let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "2"
let g:jedi#completions_enabled=0


" YouCompleteMe

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion=1
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

nnoremap <leader>d :YcmCompleter GoTo<CR>

let g:SimpylFold_docstring_preview=1
let python_highlight_all=1

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

"""""""""
" airline
"""""""""
set t_Co=256 " Needed to activate 256 colors in vim
" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme             = 'wombat'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

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
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline_powerline_fonts = 1

""""""""""
" NERDTree
""""""""""
" Open NERDTRee while starting vim if no file was chosen, and close it when it is the last window.
augroup NERDTreeCustomCommands
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup end

""""""""""""
" Easy Align
""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""
" Syntastic
"""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

""""""""""""""
" vim-fugitive
""""""""""""""
autocmd QuickFixCmdPost *grep* cwindow

"""""""""""
" Terraform
"""""""""""
let g:terraform_fmt_on_save = 1

""""""""""""""""""""""
" Custom configuration
""""""""""""""""""""""
" set foldmethod=indent
" set foldnestmax=20
set foldlevelstart=20 "http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file

set modeline " Load modelines when file opens, i.e.: # vim: set ts=2 :
             " http://vim.wikia.com/wiki/Modeline_magic

augroup BeforeExit
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e "Automatically removes all trailing whitespace
augroup end

runtime macros/matchit.vim " match the opening/closing html tag when pressing '%'

" Search for visually selected text - Vim Tips Wiki - Wikia
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
" To use the mapping, visually select the characters that are wanted in the
" search, then type // to search for next occurrence of the selected text.
vnoremap // y/<C-R>"<CR>

"""""""
" CtrlP
"""""""
" Changing cursor-line to make it more recognizable
hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkred guifg=white
hi CursorColumn ctermfg=White ctermbg=darkgray cterm=bold guifg=white guibg=yellow gui=bold
map <F3> :set cursorcolumn!<Bar>set cursorline!<CR>
let g:ctrlp_match_window = 'results:99'

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --smart-case

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$" --ignore "*.log"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

let g:ctrlp_working_path_mode = 'rw'

" Additional mapping for buffer search
" nnoremap <C-o> :CtrlPBuffer<CR>
" nnoremap <C-i> :CtrlPMRUFiles<CR>
nnoremap <leader>b :CtrlPBuffer<cr>

" Default to filename searches
" let g:ctrlp_by_filename = 1

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <leader>t :CtrlPTag<cr>
""""""""
" Ag-vim
""""""""

let g:ag_prg="ag --column --nogroup --noheading --ignore '*.log'"

""""""""""
" vim-json
""""""""""
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""

""""""""""""""""
" Custom keymaps
""""""""""""""""
" <leader>x to close current buffer
nmap <silent> <leader>x :bd<CR>
" <leader>a to closse all buffers
nmap <silent> <leader>a :bufdo! bd<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" nnoremap <Esc>h :NERDTreeFind<CR>
nnoremap <C-h> :NERDTreeFind<CR>

" Ctrl-t opens the TaskList inside a file
map <C-t> <Plug>TaskList

" Ctrl-g opens Mundo
let g:mundo_prefer_python3 = 1
map <C-g> :MundoToggle<CR>

" Map jk to always advance a screen line
nnoremap j gj
nnoremap k gk

" ,c toggles comment (Tcomment)
nmap <silent> <leader>c :TComment<CR>
vmap <silent> <leader>c :TComment<CR>

" Ctrl J/K add blank lines above and below
" nnoremap <Esc>j m`o<Esc>``
" nnoremap <Esc>k m`O<Esc>``
nnoremap <C-j> m`o<Esc>``
nnoremap <C-k> m`O<Esc>``

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<c-k>"

" Easily move between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Vim multicursor
let g:multi_cursor_start_key='<F6>'

" Format JSON
" map <Leader>j !python -m json.tool<CR>
map <Leader>j !jq '.'<CR>

"""""""""""""""""""""""""""""""""
" Vim and CSS
" Autocomplete for CSS
" Start typing then Ctrl-x Ctrl-o
"""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""""""""
" Docker
""""""""
autocmd BufRead,BufNewFile Rockerfile set ft=Dockerfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoiding the Ctrl-U 'feature' of deleting your text and not allowing you to
" undo this deletion
" With the help of http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"""""""""""""""""""""""""""""""""""""""""""
" Custom status line (overriden by airline)
"""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                                " Always show the status line
" set statusline=%-40F                            " Full filename
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
" set statusline+=%{&ff}]                         " file format
" set statusline+=%h                              " help file flag
" set statusline+=%m                              " modified flag
" set statusline+=%r                              " read only flag
" set statusline+=%y                              " filetype
" set statusline+=%=                              " left/right separator
" set statusline+=%c,                             " cursor column
" set statusline+=%l/%L                           " cursor line/total lines
" set statusline+=\ %P                            " percent through file

""""""""""""""""""""""""""""""
" Specific files Configuration
""""""""""""""""""""""""""""""
au FileType python setlocal ts=4 sts=4 sw=4

au BufRead,BufNewFile *.md set filetype=markdown
au FileType markdown setlocal ts=4 sts=4 sw=4

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null " http://ku1ik.com/2011/09/08/formatting-xml-in-vim-with-indent-command.html

au FileType scss.css setlocal foldmethod=marker
au FileType scss.css setlocal foldmarker={,}

""""""""""""""
" LaTeX things
""""""""""""""
" Compiles TeX when you save it
" Requires Tim Pope's vim-dispatch plugin
" au FileType tex let b:dispatch = 'pdflatex -shell-escape %'
" au BufWritePost *.tex :Dispatch!

" au FileType markdown let b:dispatch = 'pandoc -s --toc -c pandoc.css % -o %:r.html'
" au BufWritePost *.md :Dispatch!

" section jumping, from: http://vim.wikia.com/wiki/Section_jump_in_Latex
noremap <buffer> <silent> ]] :<c-u>call TexJump2Section( v:count1, '' )<CR>
noremap <buffer> <silent> [[ :<c-u>call TexJump2Section( v:count1, 'b' )<CR>
function! TexJump2Section( cnt, dir )
  let i = 0
  let pat = '^\s*\\\(part\|chapter\|\(sub\)*section\|paragraph\)\>\|\%$\|\%^'
   let flags = 'W' . a:dir
   while i < a:cnt && search( pat, flags ) > 0
     let i = i+1
   endwhile
   let @/ = pat
 endfunction

""""""""""""""""""""""
" vim-markdown-folding
""""""""""""""""""""""
" set nocompatible
" if has("autocmd")
"   filetype plugin indent on
" endif

""""""""
" Hint "
""""""""
" Como ver quais são as teclas mapeadas no vim:
" :nmap for normal mode mappings
" :vmap for visual mode mappings
" :imap for insert mode mappings
" :mkexrc Write current key mappings and changed options to [file]
