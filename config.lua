--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

--[[
--------------
DEBUGGING LVIM
--------------
With hints from [Everything you need to know to configure neovim using lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/) and [A guide to using Lua in Neovim](https://github.com/nanotee/nvim-lua-guide)

To inspect a config e.g. `vim.opt.autoindent`:
  :lua print(vim.inspect(vim.opt.autoindent))

# Adapting from vimscript to lua

vimscript:
  set tabstop=2
  set cursorline
  set nocursorline
  let g:zoom#statustext = 'Z'
lua:
  vim.opt.tabstop = 2
  vim.opt.cursorline = true
  vim.opt.cursorline = false
  vim.g['zoom#statustext'] = 'Z'

# Listing mappings

- Keybindings set by LunarVim:
  <leader>Lk
- Check if a particular key has already been bound:
  :verbose map <TAB>
- Just list every map
  :map
- Output this to a searchable buffer
  :enew|pu=execute('map')

# Useful infos LSP & friends

:LspInfo
:LspInstallInfo
:LvimInfo
:NullLsInfo -- Formatters and Linters info
:TSInstallInfo
:PackerStatus -- List all installed plugins
:PackerInstall

]]
--

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "seoul256"
vim.opt.clipboard = ""
vim.opt.iskeyword = vim.opt.iskeyword + "-"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

lvim.keys.normal_mode["]b"] = ":BufferNext<CR>"
lvim.keys.normal_mode["[b"] = ":BufferPrevious<CR>"

-- Window movement
vim.g["tmux_navigator_no_mappings"] = true -- Custom Key Bindings
-- vim.g['tmux_navigator_save_on_switch'] = true -- Activate autoupdate on exit
-- vim.g['tmux_navigator_disable_when_zoomed'] = true -- Disable vim->tmux navigation when the Vim pane is zoomed in tmux
-- vim.g['tmux_navigator_preserve_zoom'] = true -- If the Vim pane is zoomed, stay zoomed when moving to another tmux pane

vim.g["switch_mapping"] = "-"

lvim.keys.normal_mode["<A-h>"] = ":TmuxNavigateLeft<CR>"
lvim.keys.normal_mode["<A-j>"] = ":TmuxNavigateDown<CR>"
lvim.keys.normal_mode["<A-k>"] = ":TmuxNavigateUp<CR>"
lvim.keys.normal_mode["<A-l>"] = ":TmuxNavigateRight<CR>"

lvim.keys.normal_mode["<C-h>"] = "<cmd>NvimTreeFindFile<CR>"
lvim.keys.normal_mode["<C-j>"] = "<Esc>o<Esc>"
lvim.keys.normal_mode["<C-k>"] = "<Esc>O<Esc>"
lvim.keys.normal_mode["<C-l>"] = "<cmd>nohlsearch<CR>"

-- Resize with arrows
lvim.keys.normal_mode["<Up>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<Down>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<Left>"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<Right>"] = ":vertical resize +2<CR>"

-- use the default vim behavior for H and L
lvim.keys.normal_mode["<S-l>"] = false
lvim.keys.normal_mode["<S-h>"] = false
vim.opt.scrolloff = 0 -- Required so L moves to the last line

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

vim.cmd([[
  " Configure Vim-EasyAlign
  nmap ga <Plug>(EasyAlign)
  xmap ga <Plug>(EasyAlign)

  " Fix common typos in command mode
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
  command! -bang W w<bang>
  command! -bang WQ wq<bang>
  command! -bang Wq wq<bang>

  " Fugitive Conflict Resolution
  """"""""""""""""""""""""""""""
  nnoremap <leader>gd :Gvdiff!<CR>
  nnoremap gdh :diffget //2<CR>
  nnoremap gdl :diffget //3<CR>
  " From: https://medium.com/prodopsio/solving-git-merge-conflicts-with-vim-c8a8617e3633
  " And: http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/

  let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
  let g:vimwiki_ext2syntax = { '.markdown': 'markdown', '.md': 'markdown', '.mdown': 'markdown', '.mdwn': 'markdown', '.mkd': 'markdown', '.mkdn': 'markdown', '.wiki': 'media' }
  " Append wiki file extension to links in Markdown
  let g:vimwiki_markdown_link_ext = 1
  let g:vimwiki_global_ext = 0
]])

lvim.builtin.which_key.mappings["w"] = { name = "VimWiki" }
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["c"] = { "<cmd>lua require('Comment').toggle()<CR>", "Comment" }
lvim.builtin.which_key.vmappings["c"] = {
	"<ESC><CMD>lua require('Comment.api').gc(vim.fn.visualmode())<CR>",
	"Comment",
}
lvim.builtin.which_key.mappings["B"] = { "<cmd>Telescope buffers<cr>", "Open Buffers" }
lvim.builtin.which_key.mappings["E"] = { "<cmd>NvimTreeFindFile<CR>", "ExploreFile" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["s"]["s"] = { "<cmd>LuaSnipListAvailable<CR>", "Snippets" }
lvim.builtin.which_key.mappings["s"]["w"] = { "<cmd>Telescope grep_string<CR>", "Word" }
lvim.builtin.which_key.mappings["s"]["F"] = { "<cmd>Telescope file_browser<CR>", "File Browser" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.dap.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"css",
	"dockerfile",
	"go",
	"javascript",
	"json",
	"lua",
	"python",
	"ruby",
	"hcl",
	"typescript",
	"vim",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
	-- Colorscheme and look and feel
	{ "junegunn/seoul256.vim" }, -- Colorscheme
	{ "junegunn/rainbow_parentheses.vim" }, -- Colored Parenthesis

	-- Navigation
	{ "christoomey/vim-tmux-navigator" }, -- Vim integration with Tmux

	-- Git integration
	{ "tpope/vim-fugitive" }, -- Git integration inside vim
	{ "tpope/vim-rhubarb" }, -- :GBrowse from to open GitHub URLs. Omni-complete on commit messages

	-- Generic editing improvements
	-- { "RRethy/vim-illuminate" }, -- Automatically highlighting other uses of the word under the cursor
	{ "andrewradev/switch.vim" }, -- Switch segments of text with predefined replacements
	{ "junegunn/vim-easy-align" }, -- A Vim alignment plugin
	{ "mzlogin/vim-markdown-toc" }, -- Generate Table of Contents for Markdown files
	{ "tpope/vim-repeat" }, -- Enable repeating supported pluging maps with .
	{ "tpope/vim-rsi" }, -- Readline Key Bindings
	{ "tpope/vim-surround" }, -- Ease surrounding
	{ "vimwiki/vimwiki" }, -- Personal Wiki for Vim
	-- {"tools-life/taskwiki"}, -- Proper project management with Taskwarrior in vim (https://www.youtube.com/watch?v=UuHJloiDErM)

	-- Development Experience Improvements
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "preservim/tagbar" }, -- Tags
	{ "nathanaelkane/vim-indent-guides" }, -- Indent Lines
}

vim.g["seoul256_background"] = 236
vim.g["seoul256_srgb"] = 1
vim.opt.showmode = true
vim.opt.relativenumber = true
vim.opt.listchars = { eol = "$", tab = "→ ", trail = "␣", extends = "…" }
-- vim.g["vimwiki_list"] = "[{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]"
-- vim.g["vimwiki_ext2syntax"] =
-- 	"{ '.markdown': 'markdown', '.md': 'markdown', '.mdown': 'markdown', '.mdwn': 'markdown', '.mkd': 'markdown', '.mkdn': 'markdown', '.wiki': 'media' }"
-- -- Append wiki file extension to links in Markdown
-- vim.g["vimwiki_markdown_link_ext"] = 1
-- vim.g["vimwiki_global_ext"] = 0
lvim.lsp.diagnostics.underline = false

-- Look at https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting for available formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "black", filetypes = { "python" } },
	{ exe = "goimports", filetypes = { "go" } },
	{ exe = "json_tool", filetypes = { "json" } },
	{ exe = "shfmt", filetypes = { "sh" }, args = { "-i", "4" } },
	{ exe = "stylua", filetypes = { "lua" } },
	{ exe = "terraform_fmt", filetypes = { "terraform" } },
	{ exe = "trim_newlines" },
	{ exe = "trim_whitespace" },
})

-- Look at https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/diagnostics/ for available linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ exe = "golangci-lint", filetypes = { "go" } },
	{ exe = "pylint", filetypes = { "python" } },
	{ exe = "shellcheck", filetypes = { "sh" } },
	{ exe = "selene", filetypes = { "lua" } },
})

-- Creating a new snippet based on the examples at https://github.com/L3MON4D3/LuaSnip/blob/8f2bf6b0e3/Examples/snippets.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
ls.snippets = {
	sh = {
		s({ trig = "sbash", dscr = "Safe bash mode" }, {
			t({ "#!/usr/bin/env bash", "" }),
			t({ "set -euo pipefail", "" }),
			t({ "IFS=$'\\n\\t'", "" }),
			t({ "", "" }), -- Linebreak
			i(0),
		}),
	},
}

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }
--
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- On entering insert mode in any file, scroll the window so the cursor line is centered
--   {"InsertEnter", "*", ":normal zz"},
-- }
