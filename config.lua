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
vim.opt.scrolloff = 0 -- Required so L moves to the last line

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = false
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Window Zooming
lvim.keys.normal_mode["Zz"] = "<C-w>_|<C-w>|"
lvim.keys.normal_mode["Zo"] = "<C-w>="

lvim.keys.normal_mode["]b"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["[b"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["]B"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["[B"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["]g"] = "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>"
lvim.keys.normal_mode["[g"] = "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>"

-- Configuration for the "andrewradev/switch.vim" plugin
-- Had to put it here so the configuration is loaded before the plugin
vim.g["switch_mapping"] = "-"

-- Window movement
lvim.keys.normal_mode["<A-h>"] = "<CMD>NavigatorLeft<CR>"
lvim.keys.normal_mode["<A-l>"] = "<CMD>NavigatorRight<CR>"
lvim.keys.normal_mode["<A-k>"] = "<CMD>NavigatorUp<CR>"
lvim.keys.normal_mode["<A-j>"] = "<CMD>NavigatorDown<CR>"
lvim.keys.normal_mode["<A-p>"] = "<CMD>NavigatorPrevious<CR>"

lvim.keys.normal_mode["<C-h>"] = false
lvim.keys.normal_mode["<C-j>"] = "<Esc>o<Esc>"
lvim.keys.normal_mode["<C-k>"] = "<Esc>O<Esc>"
lvim.keys.normal_mode["<C-l>"] = "<cmd>nohlsearch<CR>"

-- Resize with arrows
lvim.keys.normal_mode["<Up>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<Down>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<Left>"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<Right>"] = ":vertical resize +2<CR>"

-- quit insert mode
lvim.keys.insert_mode["kj"] = "<ESC>"
lvim.keys.insert_mode["jk"] = "<ESC>"

-- move through wrapped lines
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.normal_mode["j"] = "gj"

-- Correcting spelling mistakes on the fly
-- [How I'm able to take notes in mathematics lectures using LaTeX and Vim | Gilles Castel](https://castel.dev/post/lecture-notes-1/)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "gitcommit" },
	callback = function()
		vim.cmd([[
      setlocal spell
      set spelllang=en_ca
      inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u
    ]])
	end,
})

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

-- Cellular Automaton Slide Animation
local slide_animation = {
	fps = 50,
	name = "slide",
}

slide_animation.update = function(grid)
	for i = 1, #grid do
		local prev = grid[i][#grid[i]]
		for j = 1, #grid[i] do
			grid[i][j], prev = prev, grid[i][j]
		end
	end
	return true
end

require("cellular-automaton").register_animation(slide_animation)

-- Use which-key to add extra bindings with the leader-key prefix

lvim.builtin.which_key.mappings["C"] = {
	name = "+CellularAutomaton",
	l = { "<cmd>CellularAutomaton game_of_life<cr>", "Game of life" },
	r = { "<cmd>CellularAutomaton make_it_rain<cr>", "Make it rain" },
	s = { "<cmd>CellularAutomaton slide<cr>", "Slide" },
}
lvim.builtin.which_key.mappings["D"] = {
	name = "+DiffView",
	o = { "<cmd>DiffviewOpen<cr>", "Open" },
	c = { "<cmd>DiffviewClose<cr>", "Close" },
	h = { "<cmd>DiffviewFileHistory<cr>", "File History" },
}
lvim.builtin.which_key.mappings["E"] = { "<cmd>NvimTreeFindFile<CR>", "ExploreFile" }
lvim.builtin.which_key.mappings["M"] = {
	name = "+MarkdownPreview",
	o = { "<cmd>MarkdownPreview<cr>", "Open" },
	s = { "<cmd>MarkdownPreviewStop<cr>", "Stop" },
	t = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle" },
}
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["q"] = {}
lvim.builtin.which_key.mappings["s"]["s"] = { "<cmd>Telescope luasnip<CR>", "Snippets" }
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
lvim.builtin.which_key.mappings["V"] = { "<cmd>lua Toggle_venn()<CR>", "Toggle Venn" }
lvim.builtin.which_key.mappings["w"] = { name = "VimWiki" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.dap.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"css",
	"dockerfile",
	"go",
	"hcl",
	"javascript",
	"json",
	"lua",
	"python",
	"ruby",
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
	{ "numToStr/Navigator.nvim" },

	-- Git integration
	{ "tpope/vim-fugitive" }, -- Git integration inside vim
	{ "tpope/vim-rhubarb" }, -- :GBrowse from to open GitHub URLs. Omni-complete on commit messages

	-- Generic editing improvements
	-- { "RRethy/vim-illuminate" }, -- Automatically highlighting other uses of the word under the cursor
	{ "andrewradev/switch.vim" }, -- Switch segments of text with predefined replacements
	{ "junegunn/vim-easy-align" }, -- A Vim alignment plugin
	-- Generate Table of Contents for Markdown files
	-- :GenTocGFM -> For GitHub style
	-- :GenTocMarked -> For MarkdownPreview style
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

	-- A tree-like view for symbols
	-- :help symbols-outline.txt
	{
		"simrat39/symbols-outline.nvim",
	},

	-- navigate and highlight matching words (A more powerful % movement)
	-- %, g%, ]%, [%
	-- :help matchup.txt
	{
		"andymass/vim-matchup",
		setup = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},

	-- git diff in a single tabpage
	-- :help diffview.txt
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},

	--  The undo history visualizer for VIM
	-- :help undotree.txt
	{
		"mbbill/undotree",
	},

	--  markdown preview plugin for (neo)vim
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},

	--  Draw ASCII diagrams in Neovim
	{ "jbyuki/venn.nvim" },

	-- The most must have useless plugin ever
	{ "eandrju/cellular-automaton.nvim" },

	-- Telescope.nvim extension that adds LuaSnip integration.
	{ "benfowler/telescope-luasnip.nvim" },
}

-- Some plugins configuration

require("Navigator").setup()

require("symbols-outline").setup()
lvim.keys.normal_mode["<leader>S"] = "<CMD>SymbolsOutline<CR>"

require("telescope").load_extension("luasnip")

lvim.builtin.treesitter.matchup.enable = true

lvim.keys.normal_mode["<leader>u"] = "<CMD>UndotreeToggle<CR>"

vim.g["seoul256_background"] = 236
vim.g["seoul256_srgb"] = 1
vim.opt.showmode = true
vim.opt.relativenumber = true
vim.opt.listchars = { eol = "$", tab = "→ ", trail = "␣", extends = "…" }
vim.opt.clipboard = ""
-- vim.g["vimwiki_list"] = "[{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]"
-- vim.g["vimwiki_ext2syntax"] =
--  "{ '.markdown': 'markdown', '.md': 'markdown', '.mdown': 'markdown', '.mdwn': 'markdown', '.mkd': 'markdown', '.mkdn': 'markdown', '.wiki': 'media' }"
-- -- Append wiki file extension to links in Markdown
-- vim.g["vimwiki_markdown_link_ext"] = 1
-- vim.g["vimwiki_global_ext"] = 0

-- Look at https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting for available formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "black", filetypes = { "python" } },
	{ exe = "goimports", filetypes = { "go" } },
	{ exe = "shfmt", filetypes = { "sh" }, args = { "-i", "2", "-ci" } },
	{ exe = "stylua", filetypes = { "lua" } },
})

-- Look at https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/diagnostics/ for available linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ exe = "golangci-lint", filetypes = { "go" } },
	{ exe = "pylint", filetypes = { "python" } },
	{ exe = "shellcheck", filetypes = { "sh" } },
	-- { exe = "selene", filetypes = { "lua" } },
	-- { exe = "markdownlint", filetypes = { "vimwiki" } },
})

-- Configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- See the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- Remove tflint from teh skipped_servers list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "tflint"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
	local venn_enabled = vim.inspect(vim.b.venn_enabled)
	if venn_enabled == "nil" then
		vim.b.venn_enabled = true
		vim.cmd([[setlocal ve=all]])
		-- draw a line on HJKL keystokes
		vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
		-- draw a box by pressing "f" with visual selection
		vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
		print("Venn Activated -- Don't forget to select text with blockwise-visual (Ctrl-v)")
	else
		vim.cmd([[setlocal ve=]])
		vim.cmd([[mapclear <buffer>]])
		vim.b.venn_enabled = nil
		print("Venn Deactivated")
	end
end

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
