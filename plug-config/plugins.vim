call plug#begin()

" Colorscheme and look and feel
Plug 'junegunn/rainbow_parentheses.vim' " Colored Parenthesis
Plug 'junegunn/seoul256.vim'            " Colorscheme
Plug 'majutsushi/tagbar'                " Class outline viewer
Plug 'mhinz/vim-startify'               " Start screen for Vim
Plug 'preservim/nerdtree'               " NERDTree
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
Plug 'mzlogin/vim-markdown-toc'         " Generate Table of Contents for Markdown files
Plug 'vimwiki/vimwiki'                  " Personal Wiki for Vim
Plug 'tools-life/taskwiki'              " Proper project management with Taskwarrior in vim (https://www.youtube.com/watch?v=UuHJloiDErM)
Plug 'RRethy/vim-illuminate'            " Automatically highlighting other uses of the word under the cursor

" Syntax and Completion
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
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
" NeoVim 0.5+ LSP integration
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'mfussenegger/nvim-lint'     " Linting
Plug 'mhartington/formatter.nvim' " Formatter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " highlighting
" TSInstall hcl

" Markdown

Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'vimwiki'] } " Markdown Vim Mode
Plug 'godlygeek/tabular', { 'for': 'markdown' }       " Vim script for text filtering and alignment

" Golang

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Amazing combination of features.
Plug 'sebdah/vim-delve' " Debugger integration via delve (Colored debugging)

" Terraform

" Plug 'hashivim/vim-terraform'         " Terraform manipulation in Vim
Plug 'hposca/ultisnips-terraform-snippets'

call plug#end()
