call plug#begin()

" Colorscheme and look and feel
Plug 'junegunn/rainbow_parentheses.vim' " Colored Parenthesis
Plug 'junegunn/seoul256.vim'            " Colorscheme
Plug 'majutsushi/tagbar'                " Class outline viewer
Plug 'mhinz/vim-startify'               " Start screen for Vim
Plug 'scrooloose/nerdtree'              " NERDTree
Plug 'simnalamburt/vim-mundo'           " Vim undo tree visualizer
Plug 'vim-airline/vim-airline'          " Powerline like statusline
Plug 'vim-airline/vim-airline-themes'   " Airline themes

" Navigation and finding
Plug 'christoomey/vim-tmux-navigator'           " Vim integration with Tmux
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " Ranger in vim
Plug 'mhinz/vim-grepper'              " Use your favorite grep tool to start an asynchronous search

" Generic editing improvements
Plug 'airblade/vim-rooter'              " Changes Vim working directory to project root
Plug 'jiangmiao/auto-pairs'             " Auto pairs for '(' '[' '{'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'          " A Vim alignment plugin
Plug 'tomtom/tcomment_vim'              " Comment like a boss
Plug 'tpope/vim-repeat'                 " Enable repeating supported pluging maps with .
Plug 'tpope/vim-rsi'                    " Readline Key Bindings
Plug 'tpope/vim-surround'               " Ease surrounding
Plug 'liuchengxu/vim-which-key'         " Shows keybindings in popup
Plug 'andrewradev/switch.vim'           " Switch segments of text with predefined replacements

" Syntax and Completion
Plug 'sheerun/vim-polyglot'                     " Better Syntax Support
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Stable version of coc
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git integration
Plug 'mhinz/vim-signify'              " Uses the sign column to indicate added, modified and removed lines
Plug 'tpope/vim-fugitive'             " Git integration inside vim
Plug 'tpope/vim-rhubarb'              " :GBrowse from to open GitHub URLs. Omni-complete on commit messages
Plug 'junegunn/gv.vim'                " A Git commit browser
Plug 'rhysd/git-messenger.vim'        " Shows the history of commits under the cursor in popup window
                                      " :GitMessenger or <Leader>gm
" Programming languages specific
""""""""""""""""""""""""""""""""

" Golang

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Amazing combination of features.
Plug 'sebdah/vim-delve' " Debugger integration via delve (Colored debugging)

" Terraform

" Plug 'hashivim/vim-terraform'         " Terraform manipulation in Vim
Plug 'hposca/ultisnips-terraform-snippets'

call plug#end()
