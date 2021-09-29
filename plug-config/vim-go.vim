" vim-go
""""""""
let g:go_fmt_command = "gopls"
" go install mvdan.cc/gofumpt@latest
let g:go_gopls_gofumpt=1
let g:go_syntastic_go_checkers = ['go', 'golint', 'errcheck']
