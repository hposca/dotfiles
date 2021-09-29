-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
    vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    format = function(entry, item)
      --item.kind = lsp_symbols[item.kind] .. " " .. item.kind
      -- set a name for each source
      item.menu =
        ({
        buffer = "[Buffer]",
        calc = "[Calc]",
        cmp_tabnine = "[Tab9]",
        emoji = "[Emoji]",
        latex_symbols = "[Latex]",
        look = "[Look]",
        luasnip = "[LuaSnip]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        spell = "[Spell]",
        treesitter = "[treesitter]",
      })[entry.source.name]
      return item
    end
  },
  sources = {
    { name = 'ultisnips' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'spell' },
  }
})

-- Setup lspconfig.
-- Language servers for most languages: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
lspconfig = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- npm i -g bash-language-server
lspconfig.bashls.setup {
  capabilities = capabilities
}
-- :LspInstall python
lspconfig.pyright.setup {
  capabilities = capabilities
}
-- https://github.com/golang/tools/tree/master/gopls
lspconfig.gopls.setup {
  capabilities = capabilities
}

-- LSP Install configs
-- https://ka.codes/posts/nvim-lspinstall#nvim-lspinstall
-- :echo stdpath("data") to find out which directory that is on your machine.

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- automatically setup servers again after `:LspInstall <server>`
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- makes sure the new server is setup in lspconfig
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
