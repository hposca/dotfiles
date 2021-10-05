-- LSP Install configs
-- https://ka.codes/posts/nvim-lspinstall#nvim-lspinstall
-- :echo stdpath("data") to find out which directory that is on your machine.

local buf_set_keymap = function(type, key, value, opts)
  vim.api.nvim_buf_set_keymap(bufnr, type, key, value, opts);
end

local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('i', '<C-j>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', ',ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', ',ce', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', ',k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', ',s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', '<leader>lde', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '<leader>ldn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<leader>ldp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', '<leader>ldq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
buf_set_keymap('n', '<leader>lF', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', opts)
buf_set_keymap('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)


-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local on_attach = function(client, bufnr)
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- AutoFormat on save
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.colorProvider = { dynamicRegistration = false }
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    local config = make_config()

    if server == "terraform" then
      config.filetypes = { "tf" }
    end
    require'lspconfig'[server].setup{config}
  end
end

setup_servers()

-- automatically setup servers again after `:LspInstall <server>`
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- makes sure the new server is setup in lspconfig
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- As a reference:
-- https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/after/plugin/lspconfig.rc.vim
--
-- NOTE: Ended up not being able to configure the linters here, so still using 'nvim-lint'
-- npm install -g diagnostic-languageserver
require'lspconfig'.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'json', 'markdown', 'python', 'sh', 'terraform', 'yaml' },
  init_options = {
    linters = {},
    filetypes = {},
    formatters = {
      black = {
        command = 'black',
        args = { '-' }
      },
      jq = {
        command = 'jq',
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      },
      -- https://github.com/mvdan/sh#shfmt
      shfmt = {
        command = 'shfmt',
        args = { '-i', 2 }
      },
      tffmt = {
        command = 'terraform',
        args = { 'fmt', '-' }
      },
    },
    formatFiletypes = {
      json = 'jq',
      markdown = 'prettier',
      python = 'black',
      sh = 'shfmt',
      terraform = 'tffmt',
      yaml = 'prettier',
    }
  }
}
