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
nnoremap <silent> ,s <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> ,rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ,ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> ,ce <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" Python configuration
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" Golang configuration
" https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
lua <<EOF
  function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end
EOF

autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 100)

" Import automatically on save
autocmd BufWritePre *.go lua goimports(1000)
" Format on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
" To make OmniFunc work
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
