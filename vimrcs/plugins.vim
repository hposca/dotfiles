" To install vim-plug:
" $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
Plug 'tpope/vim-sensible'             " Sensible vim defaults

" Colorscheme and look and feel
Plug 'junegunn/seoul256.vim'          " Colorscheme
Plug 'majutsushi/tagbar'              " Class outline viewer
Plug 'mhinz/vim-janah'                " Colorscheme
Plug 'mhinz/vim-startify'             " Start screen for Vim
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo'         " Vim undo tree visualizer
Plug 'vim-airline/vim-airline'        " Powerline like statusline
Plug 'vim-airline/vim-airline-themes' " Airline themes

" Navigation and finding
Plug 'christoomey/vim-tmux-navigator' " Vim integration with Tmux
Plug 'ctrlpvim/ctrlp.vim'             " Ctrl-P
Plug 'mhinz/vim-grepper'              " Use your favorite grep tool to start an asynchronous search
Plug 'skwp/greplace.vim'              " VIM Plugin for doing a search and replace across many files

" Generic edition improvements
Plug 'andrewradev/switch.vim'         " Switch segments of text with predefined replacements
Plug 'itchyny/vim-cursorword'         " Underlines the word under the cursor
Plug 'junegunn/rainbow_parentheses.vim' " Colored Parenthesis
Plug 'junegunn/vim-easy-align'        " A Vim alignment plugin
Plug 'raimondi/delimitmate'           " Auto-completion for quotes, parens, brackets
Plug 'ron89/thesaurus_query.vim'      " Multi-Language Thesaurus
Plug 'salsifis/vim-transpose'         " Transpose matrices of text
Plug 'skywind3000/asyncrun.vim'       " Run Async shell commands
Plug 'tomtom/tcomment_vim'            " Comment like a boss
Plug 'tpope/vim-rsi'                  " Readline Key Bindings
Plug 'tpope/vim-surround'             " Ease surrounding
Plug 'vim-scripts/AnsiEsc.vim'        " Color from terminal redirected output


" Git
"""""
Plug 'junegunn/gv.vim'                " A git commit browser
Plug 'mhinz/vim-signify'              " Uses the sign column to indicate added, modified and removed lines
Plug 'tpope/vim-fugitive'             " Git integration inside vim
Plug 'rhysd/git-messenger.vim'        " Shows the history of commits under the cursor in popup window
                                      " :GitMessenger or <Leader>gm

" Markdown
""""""""""
Plug 'mzlogin/vim-markdown-toc'       " Automatic Table of Contents generation for Markdown
Plug 'plasticboy/vim-markdown', {'for': 'markdown'} " Markdown vim mode

" AutoCompletion
""""""""""""""""

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-syntastic/syntastic'        " Syntax checking hacks for vim
" Need to make sure that neovim-python APIs are installed:
" pip2 install --user neovim
" pip3 install --user neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Programming specific
""""""""""""""""""""""

Plug 'AndrewRadev/splitjoin.vim' " Easy transition between multiline and single-line code (gS, gJ)

" Ruby
""""""

" https://chodounsky.net/2016/12/09/using-tags-to-browse-ruby-and-gem-source-with-vim/
Plug 'adelarsq/vim-matchit'           " Extended power for the '%' operator, required by vim-ruby-refactoring
Plug 'ecomba/vim-ruby-refactoring'    " Ruby Refactoring Tool for Vim
Plug 'fishbullet/deoplete-ruby'     " Deoplete for Ruby
Plug 'tpope/vim-bundler'              " Lightweight support for Ruby's Bundler
Plug 'tpope/vim-endwise'              " wisely add 'end' in ruby
Plug 'tpope/vim-rails'                " Ruby on Rails Power tools from Tim Pope
Plug 'vim-ruby/vim-ruby'              " Ruby on Rails Power tools from Tim Pope

" Terraform
"""""""""""

Plug 'hashivim/vim-terraform'         " Terraform manipulation in Vim
Plug 'hposca/ultisnips-terraform-snippets'
" Need to `gem install json neovim` before using it
" Still haven't figured out how to make it fully IDE-like as in the asciinema
" demonstrations. But, at least using 'Ctrl-X Ctrl-O' works after some prefix.
Plug 'juliosueiras/vim-terraform-completion'

" Docker
""""""""

Plug 'ekalinin/Dockerfile.vim'

" Python
""""""""

" Requires jedi to be installed: `pip install --user jedi`
Plug 'zchee/deoplete-jedi'          " Deoplete for Python

" Golang
""""""""

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Amazing combination of features.
Plug 'godoctor/godoctor.vim' " Some refactoring tools
" Plug 'jodosha/vim-godebug' " Debugger integration via delve
Plug 'sebdah/vim-delve' " Debugger integration via delve (Colored debugging)
" Plug 'Shougo/neopairs' " https://github.com/Shougo/deoplete.nvim/issues/608

" Testing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wannesm/wmgraphviz.vim'
call plug#end()
