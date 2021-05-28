" vimwiki
"""""""""
" https://github.com/vimwiki/vimwiki
" https://vimwiki.github.io/
"
"   Key bindings
"
"   <Leader>ww – Open the default wiki index file
"   <Leader>ws – Select and open wiki index file
"   <Enter> – Follow/Create wiki link
"   <Backspace> – Go back to parent(previous) wiki link
"   <Tab> – Find next wiki link
"   <Shift-Tab> – Find previous wiki link
"
"   For more keys, see :h vimwiki-mappings
"
"   Basic key bindings
"
"     <Leader>ww -- Open default wiki index file.
"     <Leader>wt -- Open default wiki index file in a new tab.
"     <Leader>ws -- Select and open wiki index file.
"     <Leader>wd -- Delete wiki file you are in.
"     <Leader>wr -- Rename wiki file you are in.
"     <Enter> -- Follow/Create wiki link.
"     <Shift-Enter> -- Split and follow/create wiki link.
"     <Ctrl-Enter> -- Vertical split and follow/create wiki link.
"     <Backspace> -- Go back to parent(previous) wiki link.
"     <Tab> -- Find next wiki link.
"     <Shift-Tab> -- Find previous wiki link.
"
" Advanced key bindings
"
" Refer to the complete documentation at :h vimwiki-mappings to see many more bindings.
" Commands
"
"     :Vimwiki2HTML -- Convert current wiki link to HTML.
"     :VimwikiAll2HTML -- Convert all your wiki links to HTML.
"     :help vimwiki-commands -- List all commands.
"     :help vimwiki -- General vimwiki help docs.

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = { '.markdown': 'markdown', '.md': 'markdown', '.mdown': 'markdown', '.mdwn': 'markdown', '.mkd': 'markdown', '.mkdn': 'markdown', '.wiki': 'media' }
" Append wiki file extension to links in Markdown
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext = 0
