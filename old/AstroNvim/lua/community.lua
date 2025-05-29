-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.helm" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },

  -- { import = "astrocommunity.color.headlines-nvim" },
  { import = "astrocommunity.color.tint-nvim" },

  { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.completion.cmp-emoji" },
  { import = "astrocommunity.completion.cmp-git" },

  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },

  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
}
