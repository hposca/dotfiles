" Grepper
"""""""""

runtime plugin/grepper.vim
" nnoremap K :Grepper <cr>
nnoremap <leader>* :Grepper -tool git -open -switch -cword -noprompt<cr>

let g:grepper.highlight = 1
let g:grepper.dir = 'repo,file,cwd'
let g:grepper.rg.grepprg .= ' --smart-case'
