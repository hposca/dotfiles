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

" Generic editing improvements
Plug 'airblade/vim-rooter'              " Changes Vim working directory to project root
Plug 'itchyny/vim-cursorword'           " Underlines the word under the cursor
Plug 'jiangmiao/auto-pairs'             " Auto pairs for '(' '[' '{'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'          " A Vim alignment plugin
Plug 'tomtom/tcomment_vim'              " Comment like a boss
Plug 'tpope/vim-repeat'                 " Enable repeating supported pluging maps with .
Plug 'tpope/vim-rsi'                    " Readline Key Bindings
Plug 'tpope/vim-surround'               " Ease surrounding
Plug 'liuchengxu/vim-which-key'         " shows keybindings in popup

" Syntax and Completion
Plug 'sheerun/vim-polyglot'                     " Better Syntax Support
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Stable version of coc
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

call plug#end()
