-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.clipboard = ""

opt.foldenable = true -- enable fold for nvim-ufo
opt.foldlevel = 99 -- set high foldlevel for nvim-ufo
opt.foldlevelstart = 99 -- start with all code unfolded
opt.foldcolumn = "1"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- VimWiki options
vim.cmd([[
  " Fix common typos in command mode
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
  command! -bang W w<bang>
  command! -bang WQ wq<bang>
  command! -bang Wq wq<bang>

  let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
  let g:vimwiki_ext2syntax = { '.markdown': 'markdown', '.md': 'markdown', '.mdown': 'markdown', '.mdwn': 'markdown', '.mkd': 'markdown', '.mkdn': 'markdown', '.wiki': 'media' }
  " Append wiki file extension to links in Markdown
  let g:vimwiki_markdown_link_ext = 1
  let g:vimwiki_global_ext = 0
]])
