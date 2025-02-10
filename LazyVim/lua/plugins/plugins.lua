-- TODO
-- - [ ] autopairs for parenthesis/quotes not working sometimes

-- From https://github.com/meuter/lualine-so-fancy.nvim/blob/main/lua/lualine/components/fancy_lsp_servers.lua
local LspServers = require("lualine.component"):extend()

function LspServers:init(options)
	options.icon = options.icon or "󰌘"
	options.split = options.split or ","
	LspServers.super.init(self, options)
end

function LspServers:update_status()
	local buf_clients = nil
	if vim.lsp.get_clients ~= nil then
		-- buf_get_client is deprecated in nvim >=0.10.0
		buf_clients = vim.lsp.get_clients({ bufnr = 0 })
	else
		buf_clients = vim.lsp.buf_get_clients()
	end
	local null_ls_installed, null_ls = pcall(require, "null-ls")
	local buf_client_names = {}
	for _, client in pairs(buf_clients) do
		if client.name == "null-ls" then
			if null_ls_installed then
				for _, source in ipairs(null_ls.get_source({ filetype = vim.bo.filetype })) do
					table.insert(buf_client_names, source.name)
				end
			end
		else
			table.insert(buf_client_names, client.name)
		end
	end

	-- Listing formatters via conform
	-- :ConformInfo
	local conform_installed, conform = pcall(require, "conform")
	if conform_installed then
		for _, formatter in ipairs(conform.list_formatters_for_buffer(vim.fn.bufnr())) do
			table.insert(buf_client_names, formatter)
		end
	end

	return table.concat(buf_client_names, self.options.split)
end

-- NeoTree toggle Focus
-- Based on AstroVim's
function Toggle_NeoTree_Focus()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd.Neotree("focus")
	end
end

vim.treesitter.language.register("markdown", "vimwiki")

-- https://github.com/Saghen/blink.cmp/issues/1098#issuecomment-2619750942
local source_priority = {
	snippets = 4,
	lsp = 5,
	path = 2,
	buffer = 1,
}

return {
	--
	-- Disabling LazyVim plugins
	--

	{ "folke/flash.nvim", enabled = false },
	{ "ggandor/flit.nvim", enabled = false },
	{ "ggandor/leap.nvim", enabled = false },
	{ "echasnovski/mini.surround", enabled = false },
	{ "snacks.nvim", opts = { scroll = { enabled = false } } },
	{
		"ibhagwan/fzf-lua",
		keys = {
			{ "<leader>/", false },
		},
	},
	--
	-- colorscheme
	--

	{ "catppuccin/nvim" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},

	--
	-- Movements
	--

	{
		"max397574/better-escape.nvim",
		opts = {
			mappings = {
				i = {
					j = {
						j = "<Esc>",
						k = "<Esc>",
					},
					k = {
						j = "<Esc>",
						k = "<Esc>",
					},
				},
			},
		},
	},
	-- Smoothly navigate between neovim and terminal multiplexer(s)
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	},
	-- Readline Key Bindings
	{ "tpope/vim-rsi" },

	--
	-- Text Manipulation
	--

	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader>/", false },
		},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	-- A Vim alignment plugin
	{ "junegunn/vim-easy-align" },
	-- :GenTocGFM -> For GitHub style
	-- :GenTocMarked -> For MarkdownPreview style
	{ "mzlogin/vim-markdown-toc" },
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		config = function()
			require("render-markdown").setup({
				file_types = { "markdown", "vimwiki" },
				heading = {
					-- backgrounds = { },
					width = "block",
					min_width = 30,
				},
			})
		end,
	},
	{ "andrewradev/switch.vim" },
	--  Draw ASCII diagrams in Neovim
	--  Before using it is better to:
	--    :set ve=all
	--  Then, after you are done
	--    :set ve=block
	{ "jbyuki/venn.nvim" },
	-- Easy surrounding
	{ "tpope/vim-surround" },
	-- Personal Wiki for Vim
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = { {
				path = "~/vimwiki/",
				syntax = "markdown",
				ext = ".md",
			} }
			vim.g.vimwiki_ext2syntax = {
				[".markdown"] = "markdown",
				[".md"] = "markdown",
				[".mdown"] = "markdown",
				[".mdwn"] = "markdown",
				[".mkd"] = "markdown",
				[".mkdn"] = "markdown",
				[".wiki"] = "media",
			}
			-- Append wiki file extension to links in Markdown
			vim.g.vimwiki_markdown_link_ext = 1
			vim.g.vimwiki_global_ext = 0
		end,
	},
	{
		"mattn/calendar-vim",
		init = function()
			vim.g.calendar_diary = "~/vimwiki/diary/"
		end,
	},

	--
	-- Git integration
	--

	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
	-- :GBrowse from to open GitHub URLs. Omni-complete on commit messages
	{ "tpope/vim-rhubarb" },
	-- A vim extension to fugitive.vim for GitLab support
	{ "shumphrey/fugitive-gitlab.vim" },

	--
	-- UI
	--

	{
		"yorickpeterse/nvim-window",
		keys = {
			{ "<leader>j", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
		},
		config = true,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"s1n7ax/nvim-window-picker",
			opts = { hint = "floating-big-letter" },
		},
		keys = {
			{ "<C-\\>", "<cmd>lua Toggle_NeoTree_Focus()<CR>", desc = "Toggle NeoTree Focus" },
		},
		opts = {
			window = {
				mappings = {
					["-"] = "toggle_node",
					["l"] = "open",
					["h"] = "close_node",
					["S"] = "split_with_window_picker",
					["s"] = "vsplit_with_window_picker",
					["<C-x>"] = "split_with_window_picker",
					["<C-v>"] = "vsplit_with_window_picker",
				},
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- Classic command line position
			-- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#classic-cmdline

			-- cmdline = {
			-- 	view = "cmdline",
			-- },

			-- Command line and popup menu together
			-- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#display-the-cmdline-and-popupmenu-together

			views = {
				cmdline_popup = {
					position = {
						row = "98%",
						col = "8%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = "94%",
						col = "7%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
		},
	},
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				mode = { "n", "v" },
				["<leader>M"] = { name = "+MarkdownPreview" },
				["<leader>W"] = { name = "+Windows" },
				["<leader>w"] = { name = "+VimWiki" },
			},
		},
	},
	-- TODO: Configure it correctly
	-- Dim inactive windows in Neovim using window-local highlight namespaces
	-- {
	-- 	"levouh/tint.nvim",
	-- 	config = function()
	-- 		require("tint").setup()
	-- 	end,
	-- },

	--
	-- Coding
	--

	-- Another alternative: https://github.com/olexsmir/gopher.nvim
	{ "fatih/vim-go" },
	{
		"saghen/blink.cmp",
		optional = true,
		opts = {
			snippets = {
				preset = "luasnip",
			},
			-- https://github.com/Saghen/blink.cmp/issues/1098#issuecomment-2619750942
			-- fuzzy = {
			-- 	sorts = {
			-- 		function(a, b)
			-- 			return source_priority[a.source_id] > source_priority[b.source_id]
			-- 		end,
			-- 		-- defaults
			-- 		"score",
			-- 		"sort_text",
			-- 	},
			-- },
		},
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_lua").lazy_load()
			require("luasnip.loaders.from_lua").lazy_load({
				paths = { vim.fn.stdpath("config") .. "/snippets" },
			})
		end,
	},
	-- Telescope.nvim extension that adds LuaSnip integration.
	{
		"benfowler/telescope-luasnip.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("luasnip")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- #ANSIBLE
				"ansible-language-server",
				"ansible-lint",

				-- #AWK
				"awk-language-server",

				-- #BASH
				"bash-debug-adapter",
				"bash-language-server",
				"beautysh",
				"shellcheck",
				"shellharden",
				"shfmt",

				-- #DHALL
				"dhall-lsp",

				-- DOCKER
				"docker-compose-language-service",
				"dockerfile-language-server",
				"hadolint",

				-- #DOT
				"dot-language-server",

				-- #GO
				"delve",
				"goimports",
				"golangci-lint",
				"gopls",
				-- "djlint",
				-- "go-debug-adapter",
				-- "gofumpt",
				-- "goimports-reviser",
				-- "golangci-lint-langserver",
				-- "golines",
				-- "gomodifytags",
				-- "gospel",
				-- "gotests",
				-- "gotestsum",
				-- "iferr",
				-- "impl",
				-- "json-to-struct",
				-- "revive",
				-- "semgrep",
				-- "sonarlint-language-server",
				-- "staticcheck",

				-- #HELM
				"helm-ls",

				-- #JINJA
				-- "curlylint",
				-- "djlint",

				-- #JSON
				-- "cfn-lint",
				-- "clang-format",
				-- "fixjson",
				"jq",
				"jsonlint",
				-- "nxls",
				-- "prettier",
				"prettierd",
				-- "rome",
				-- "semgrep",
				-- "spectral-language-server",
				"json-lsp",

				-- #JSONNET
				-- "jsonnet-language-server",

				-- #JQ
				"jq-lsp",

				-- #LATEX
				-- "latexindent",
				-- "ltex-ls ltex",
				-- "tectonic",
				-- "texlab",
				-- "vale",

				-- #LUA
				"lua-language-server",
				"stylua",
				-- "lemmy-help",
				-- "luacheck",
				-- "luaformatter",
				-- "selene",

				-- #MARKDOWN
				"markdownlint",
				"marksman",
				-- "alex",
				-- "cbfmt",
				-- "glow",
				-- "grammarly-languageserver",
				-- "ltex-ls",
				-- "markdown-toc",
				-- "prettier",
				-- "prettierd",
				-- "proselint",
				-- "prosemd-lsp",
				-- "remark-cli",
				-- "remark-language-server",
				-- "rome",
				-- "textlint",
				-- "vale",
				-- "write-good",
				-- "zk",

				-- #OpenAPI
				-- "vacuum",

				-- #Protobuf
				-- "buf",
				-- "buf-language-server",
				-- "protolint",

				-- #PYTHON
				"black",
				"pyright",
				-- "autoflake",
				-- "autopep8",
				-- "blackd-client",
				-- "blue",
				-- "debugpy",
				-- "flake8",
				-- "isort",
				-- "jedi-language-server",
				-- "mypy",
				-- "pydocstyle",
				-- "pyflakes",
				-- "pylama",
				-- "pylint",
				-- "pylyzer",
				-- "pyproject-flake8",
				-- "pyre",
				-- "python-lsp-server",
				-- "reorder-python-imports",
				-- "rstcheck",
				-- "ruff",
				-- "ruff-lsp",
				-- "semgrep",
				-- "sonarlint-language-server",
				-- "sourcery",
				-- "usort",
				-- "vulture",
				-- "yapf",

				-- #RUBY
				-- "erb-lint",
				-- "htmlbeautifier",
				-- "rubocop",
				-- "ruby-lsp",
				-- "semgrep",
				-- "solargraph",
				-- "sorbet",
				-- "standardrb",

				-- #SQL
				-- "sql-formatter",
				-- "sqlfluff",
				-- "sqlfmt",
				-- "sqlls",
				-- "sqls",

				-- #TOML
				-- "taplo",

				-- #TERRAFORM
				-- "sonarlint-language-server",
				"terraform-ls",
				"tflint",
				"tfsec",

				-- #XML
				-- "lemminx",
				-- "xmlformatter",

				-- #YAML
				"yaml-language-server",
				-- "actionlint",
				-- "cfn-lint",
				-- "prettier",
				-- "prettierd",
				-- "spectral-language-server",
				-- "yamlfix",
				-- "yamlfmt",
				-- "yamllint",
				-- "yq",
			},
		},
	},
	-- https://github.com/stevearc/conform.nvim
	-- Lightweight yet powerful formatter plugin for Neovim
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				["go"] = { "goimports" },
				["json"] = { "prettierd" },
				["markdown"] = { "prettierd" },
				["python"] = { "black" },
				["sh"] = { "shfmt" },
				["vimwiki"] = { "prettierd" },
				["yaml"] = { "prettierd" },
				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				["_"] = { "trim_whitespace" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				helm_ls = {},
			},
			setup = {
				yamlls = function()
					LazyVim.lsp.on_attach(function(client, buffer)
						if vim.bo[buffer].filetype == "helm" then
							vim.schedule(function()
								vim.cmd("LspStop ++force yamlls")
							end)
						end
					end, "yamlls")
				end,
			},
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			keymap = {
				preset = "super-tab",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			-- Ensure C-space incremental selection - This was interefering with vimwiki and orgmode
			incremental_selection = {
				enable = false,
			},
			ensure_installed = {
				"awk",
				"bash",
				"bibtex",
				"c",
				"comment",
				"css",
				"dhall",
				"diff",
				"dockerfile",
				"dot",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"hcl",
				"helm",
				"html",
				"htmldjango",
				"http",
				"ini",
				"java",
				"javascript",
				"jq",
				"json",
				"json5",
				"jsonc",
				"jsonnet",
				"latex",
				"lua",
				"luadoc",
				"luap",
				"luau",
				"make",
				"markdown",
				"markdown_inline",
				"mermaid",
				"passwd",
				"python",
				"regex",
				"ruby",
				"rust",
				"sql",
				"terraform",
				"todotxt",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"nu",
			},
		},
	},
	{
		"LhKipp/nvim-nu",
		-- build = ":TSInstall nu",
		opts = {},
	},
	-- TODO: Configure it correctly
	-- Neovim plugin for splitting/joining blocks of code
	{
		"Wansmer/treesj",
		keys = {
			{
				"<leader>m",
				function()
					require("treesj").toggle({ split = { recursive = true } })
				end,
				desc = "Toggle Treesitter Join",
			},
		},
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				max_join_length = 300,
				use_default_keymaps = false,
				split = {
					recursive = true,
				},
			})
		end,
	},
	{ "mbbill/undotree" },

	-- Modified from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/editor/navic.lua
	-- lsp symbol navigation for lualine. This shows where
	-- in the code structure you are - within functions, classes,
	-- etc - in the statusline.
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		init = function()
			vim.g.navic_silence = true
			LazyVim.lsp.on_attach(function(client, buffer)
				if client.supports_method("textDocument/documentSymbol") then
					require("nvim-navic").attach(client, buffer)
				end
			end)
		end,
		opts = function()
			return {
				separator = " ",
				highlight = true,
				depth_limit = 5,
				icons = LazyVim.config.icons.kinds,
				lazy_update_context = true,
			}
		end,
		config = function()
			-- lualine integration
			require("lualine").setup({
				inactive_winbar = {
					lualine_c = {},
				},
				winbar = {
					lualine_c = {
						{
							function()
								return require("nvim-navic").get_location()
							end,
							cond = function()
								return require("nvim-navic").is_available()
							end,
						},
					},
				},
			})
		end,
	},

	-- Some modifications from the original https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/ui.lua
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_c = {
					LazyVim.lualine.root_dir(),
					{
						"diagnostics",
						symbols = {
							error = require("lazyvim.config").icons.diagnostics.Error,
							warn = require("lazyvim.config").icons.diagnostics.Warn,
							info = require("lazyvim.config").icons.diagnostics.Info,
							hint = require("lazyvim.config").icons.diagnostics.Hint,
						},
					},
					{ "filename", path = 1 },
				},
			},
			winbar = {
				lualine_x = {
					{ LspServers },
				},
				lualine_y = {
					{ "filetype" },
					{ "encoding" },
				},
				lualine_z = {
					{ "fileformat" },
				},
			},
		},
	},

	--------------------------------------------------------------------
	--------------------------------------------------------------------
	--------------------------------------------------------------------

	-- {
	-- 	"kevinhwang91/nvim-bqf",
	-- 	dependencies = {
	-- 		"junegunn/fzf",
	-- 		build = function()
	-- 			vim.fn["fzf#install"]()
	-- 		end,
	-- 	},
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- },
	-- local cmp = require("cmp")
	--
	-- {
	-- 	"hrsh7th/nvim-cmp",
	--
	-- 	opts = {
	-- 		mapping = cmp.mapping.preset.insert({
	-- 			["<tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- 		}),
	-- 	},
	-- }

	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	opts = {
	-- 		diagnostics = {
	-- 			-- Disable by default, let the user choose which style is prefered, same line as default
	-- 			virtual_text = true,
	-- 			virtual_lines = false,
	-- 		},
	-- 	},
	-- },

	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	-- 	end,
	-- },

	-- {
	-- "ray-x/go.nvim",
	-- dependencies = { -- optional packages
	-- 	"ray-x/guihua.lua",
	-- 	"neovim/nvim-lspconfig",
	-- 	"nvim-treesitter/nvim-treesitter",
	-- },
	-- config = function()
	-- 	require("go").setup()
	-- end,
	-- event = { "CmdlineEnter" },
	-- ft = { "go", "gomod" },
	-- build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	-- },

	-- {
	-- 	"simrat39/symbols-outline.nvim",
	-- 	cmd = "SymbolsOutline",
	-- 	keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
	-- 	opts = {
	-- 		-- add your options that should be passed to the setup() function here
	-- 		position = "right",
	-- 	},
	-- },

	-- {
	-- 	"abecodes/tabout.nvim",
	-- 	config = function()
	-- 		require("tabout").setup({})
	-- 	end,
	-- },

	-- {
	-- 	"cappyzawa/trim.nvim",
	-- 	config = function()
	-- 		require("trim").setup()
	-- 	end,
	-- },

	-- {
	-- 	"kevinhwang91/nvim-ufo",
	-- 	dependencies = {
	-- 		"kevinhwang91/promise-async",
	-- 		{
	-- 			"luukvbaal/statuscol.nvim",
	-- 			config = function()
	-- 				local builtin = require("statuscol.builtin")
	-- 				require("statuscol").setup({
	-- 					relculright = true,
	-- 					segments = {
	-- 						{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
	-- 						{ text = { "%s" }, click = "v:lua.ScSa" },
	-- 						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	-- 					},
	-- 				})
	-- 			end,
	-- 		},
	-- 	},
	-- 	opts = {
	-- 		provider_selector = function(bufnr, filetype, buftype)
	-- 			{ "treesitter", "indent" }
	-- 		end,
	-- 	},
	-- },
}
