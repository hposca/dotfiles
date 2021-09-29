" Change these if you want
let g:signify_sign_change            = '~'

" hunk jumping
nmap ]g <plug>(signify-next-hunk)
nmap [g <plug>(signify-prev-hunk)

autocmd User SignifyHunk call s:show_current_hunk()

function! s:show_current_hunk() abort
  let h = sy#util#get_hunk_stats()
  if !empty(h)
    echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
  endif
endfunction
