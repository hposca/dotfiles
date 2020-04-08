""""""""""""""""""""""""""""""""""
" Specific Plugins Configuration "
""""""""""""""""""""""""""""""""""

" NERDTree
""""""""""

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> :NERDTreeFind<CR>

" airline
"""""""""

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline_theme = 'bubblegum'
let g:airline_enable_branch = 1
let g:airline_powerline_fonts = 1

let g:airline#extensions#ale#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Allows to change to buffers using leader + number
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" AsyncRun
" let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" tmux-navigator
""""""""""""""""

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

" CtrlP
"""""""

nnoremap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_show_hidden = 1 " Show hidden files
let g:ctrlp_match_window = 'results:20'

" TComment
""""""""""

" ,c toggles comment (Tcomment)
nmap <silent> <leader>c :TComment<CR>
vmap <silent> <leader>c :TComment<CR>

" Terraform
"""""""""""
let g:terraform_fmt_on_save = 1
let g:terraform_completion_keys = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0


" Grepper
"""""""""

runtime plugin/grepper.vim
nnoremap K :Grepper <cr>
nnoremap <leader>* :Grepper -tool git -open -switch -cword -noprompt<cr>

let g:grepper.highlight = 1
let g:grepper.dir = 'repo,file,cwd'
let g:grepper.rg.grepprg .= ' --smart-case'

" Greplace
""""""""""
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" Switch
""""""""
let g:switch_mapping = "-"

" vim-markdown
""""""""""""""
let g:vim_markdown_folding_disabled = 1

"  RainbowParenthesis
"""""""""""""""""""""

augroup rainbow
  autocmd!
  autocmd FileType * RainbowParentheses
augroup END

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]

" Vim-Mundo
"""""""""""
let g:mundo_prefer_python3 = 1
map <C-g> :MundoToggle<CR>

" Vim-Easy-Align
""""""""""""""""
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" ALE
"""""

" Ruby/Rails
""""""""""""
" From https://chodounsky.com/2016/12/09/using-tags-to-browse-ruby-and-gem-source-with-vim/
" And https://www.sitepoint.com/effective-rails-development-vim/
set tags+=.tags
nnoremap <leader>ct :silent ! ctags -R --languages=ruby --exclude=.git --exclude=log -f .tags<cr>
