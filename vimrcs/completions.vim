" UltiSnips
"""""""""""

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Deoplete
""""""""""
let g:deoplete#enable_at_startup = 1

" <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" TAB is currently being used by UltiSnips

" Adds parenthesis automatically when completing functions
" call deoplete#custom#source('_', 'converters', ['converter_auto_paren']) " https://github.com/Shougo/deoplete.nvim/issues/608

" Deoplete - Golang
""""""""""

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
" pip3 install neovim
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" deoplete-go plugin
""""""""""""""""""""

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1

let g:go_fmt_command = "goimports"
let g:go_syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
" au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
