-- Setup nvim-cmp.

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

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
      item.menu = ({
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
