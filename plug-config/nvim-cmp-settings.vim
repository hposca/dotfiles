" General configuration
set completeopt=menu,menuone,noselect

" --local opts = { noremap = true, silent = true }
" --map_buf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
" --map_buf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
" --map_buf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
" --map_buf('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
" --map_buf('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
" --map_buf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
" --map_buf('n', ',s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
" --map_buf('n', ',wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
" --map_buf('n', ',wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
" --map_buf('n', ',wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
" --map_buf('n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
" --map_buf('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
" --map_buf('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
" --map_buf('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
" --map_buf('n', '<Leader>ce', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ,k <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ,s <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> ,rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ,ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> ,ce <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
