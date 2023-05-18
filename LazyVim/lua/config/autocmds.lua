-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Correcting spelling mistakes on the fly
-- [How I'm able to take notes in mathematics lectures using LaTeX and Vim | Gilles Castel](https://castel.dev/post/lecture-notes-1/)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "vimwiki", "gitcommit" },
	callback = function()
		vim.cmd([[
      setlocal spell
      set spelllang=en_ca
      inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u
    ]])
	end,
})
