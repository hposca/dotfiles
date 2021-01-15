" let mapleader = ","
let mapleader = " "
let $VTE_VERSION="100"

if filereadable(expand("~/.vimrc.experiment")) " We can do some experiments
  source ~/.vimrc.experiment
else
  source ~/.config/nvim/vimrcs/plugins.vim
  source ~/.config/nvim/vimrcs/settings.vim
  source ~/.config/nvim/vimrcs/plugins_config.vim
  source ~/.config/nvim/vimrcs/filetypes.vim
  source ~/.config/nvim/vimrcs/completions.vim
endif

"""""""""
" Hints "
"""""""""
" How to see all mapped keys
" :nmap for normal mode mappings
" :vmap for visual mode mappings
" :imap for insert mode mappings
" :mkexrc [file] - Write current key mappings and changed options to [file]

