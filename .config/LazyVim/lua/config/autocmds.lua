-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Correcting spelling mistakes on the fly
-- [How I'm able to take notes in mathematics lectures using LaTeX and Vim | Gilles Castel](https://castel.dev/post/lecture-notes-1/)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "gitcommit", "org" },
	callback = function()
		vim.cmd([[
      setlocal spell
      set spelllang=en_ca
      " This was moved to keymaps.lua
      " It was the only way to make it work again :/
      " inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u
    ]])
	end,
})

-- Automatically set helm type on helm files :)
-- https://neovim.discourse.group/t/detect-helm-files-with-filetype-lua/3248/3
vim.filetype.add({
	pattern = {
		[".*/templates/.*%.yaml"] = "helm",
		[".*/templates/.*%.tpl"] = "helm",
	},
})

-- Setting a big textwidth on org giles to not break links while formatting
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "org" },
	callback = function()
		vim.cmd([[
			set tw=300
		]])
	end,
})

-- Disable UI features for markdown files
-- All of these can be re-enabled via <leader>u{d,m} submenu
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- Disable diagnostics
		vim.diagnostic.enable(false)

		-- Disable render-markdown.nvim decorations
		local ok, render_markdown = pcall(require, "render-markdown")
		if ok then
			render_markdown.disable()
		end
	end,
})
