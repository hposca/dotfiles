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
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog  = '/usr/bin/python3'

" deoplete-go plugin
""""""""""""""""""""

let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
" Help from https://github.com/Shougo/deoplete.nvim/issues/965
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})

let g:go_fmt_command = "goimports"
let g:go_syntastic_go_checkers = ['go', 'golint', 'errcheck']

" vim-go with gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
" au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
