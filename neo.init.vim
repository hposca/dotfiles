" """"""""""""""""""""""""""
" " General configurations "
" """"""""""""""""""""""""""
" source ~/.config/nvim/plug-config/plugins.vim
" source ~/.config/nvim/plug-config/settings.vim
" source ~/.config/nvim/plug-config/mappings.vim
"
" """"""""""""""""""""""""""
" " Plugins Configurations "
" """"""""""""""""""""""""""
"
" source ~/.config/nvim/plug-config/airline.vim
" source ~/.config/nvim/plug-config/fzf.vim
" source ~/.config/nvim/plug-config/nerdtree.vim
" source ~/.config/nvim/plug-config/rainbow_parenthesis.vim
" source ~/.config/nvim/plug-config/ranger.vim
" source ~/.config/nvim/plug-config/tcomment.vim
" source ~/.config/nvim/plug-config/tmux-navigator.vim
" source ~/.config/nvim/plug-config/signify.vim
" source ~/.config/nvim/plug-config/which-key.vim
" source ~/.config/nvim/plug-config/coc.vim
" source ~/.config/nvim/plug-config/coc-snippets.vim
" source ~/.config/nvim/plug-config/grepper.vim
" source ~/.config/nvim/plug-config/easy-align.vim
" source ~/.config/nvim/plug-config/fugitive.vim
" source ~/.config/nvim/plug-config/mundo.vim
" source ~/.config/nvim/plug-config/switch.vim
" source ~/.config/nvim/plug-config/git-messenger.vim
" source ~/.config/nvim/plug-config/vim-go.vim
" source ~/.config/nvim/plug-config/terraform.vim
" source ~/.config/nvim/plug-config/vim-markdown.vim
" source ~/.config/nvim/plug-config/vimwiki.vim
"
" """""""""
" " Hints "
" """""""""
" " How to see all mapped keys
" " :nmap for normal mode mappings
" " :vmap for visual mode mappings
" " :imap for insert mode mappings
" " :mkexrc [file] - Write current key mappings and changed options to [file]

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'junegunn/seoul256.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" For ultisnips user.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    formatting = {
      format = function(entry, item)
        --item.kind = lsp_symbols[item.kind] .. " " .. item.kind
        -- set a name for each source
        item.menu =
          ({
          buffer = "[Buffer]",
          calc = "[Calc]",
          cmp_tabnine = "[Tab9]",
          emoji = "[Emoji]",
          latex_symbols = "[Latex]",
          look = "[Look]",
          luasnip = "[LuaSnip]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          path = "[Path]",
          spell = "[Spell]",
          treesitter = "[treesitter]",
        })[entry.source.name]
        return item
      end
    },
    sources = {
      { name = 'ultisnips' },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'spell' },
    }
  })

  -- Setup lspconfig.
  local capabilities = vim.lsp.protocol.make_client_capabilities()
--  require('lspconfig')[%YOUR_LSP_SERVER%].setup {
--    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--  }
  require('lspconfig').bashls.setup {
    capabilities = capabilities
  }
  require('lspconfig').pyright.setup {
    capabilities = capabilities
  }
  require('lspconfig').gopls.setup {
    capabilities = capabilities
  }
	--local opts = { noremap = true, silent = true }
	--map_buf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	--map_buf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	--map_buf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	--map_buf('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	--map_buf('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	--map_buf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	--map_buf('n', ',s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	--map_buf('n', ',wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	--map_buf('n', ',wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	--map_buf('n', ',wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	--map_buf('n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	--map_buf('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	--map_buf('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	--map_buf('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	--map_buf('n', '<Leader>ce', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
"nnoremap <silent> <Leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> ]a <cmd>lua vim.lsp.buf.code_action()<CR>


autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)



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
set scrolloff=8            " Screen lines to keep above and below the cursor
set colorcolumn=100        " Column at 80 characters

set splitbelow             " Horizontal splits will automatically be below
set splitright             " Vertical splits will automatically be to the right

" set conceallevel=0         " So that I can see `` in markdown files
set laststatus=2           " Always display the status line
set shortmess+=c           " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes         " Always show the signcolumn, otherwise it would shift the text each time
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

autocmd BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  set filetype=markdown
" https://www.reddit.com/r/vim/comments/esgog5/vimwiki_and_markdown_syntax/
autocmd BufWinEnter *.md setlocal syntax=markdown


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
"nnoremap <C-j> m`o<Esc>``
"nnoremap <C-k> m`O<Esc>``

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




"""""""""""""""""
" tmux-navigator"
"""""""""""""""""

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>





" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" By default timeoutlen is 1000 ms
set timeoutlen=300

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'
let g:which_key_map.7 = 'which_key_ignore'
let g:which_key_map.8 = 'which_key_ignore'
let g:which_key_map.9 = 'which_key_ignore'

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" t is for TaskWiki
let g:which_key_map.t = { 'name': '+TaskWiki' }
let g:which_key_map.t.b = { 'name': '+Burndown' }
let g:which_key_map.t.c = { 'name': '+Choose' }
let g:which_key_map.t.G = { 'name': '+Ghistory' }
let g:which_key_map.t.h = { 'name': '+History' }
let g:which_key_map.w = { 'name': '+VimWiki' }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")






" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" map <C-f> :Files<CR>
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
" nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
