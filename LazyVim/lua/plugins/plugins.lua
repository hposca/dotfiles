-- local navic = require("nvim-navic")
-- local icons = require("lazyvim.config").icons

-- TODO
-- - [ ] autopairs for parenthesis/quotes not working

return {
	--
	-- Disabling LazyVim plugins
	--

	{ "folke/flash.nvim", enabled = false },
	{ "ggandor/flit.nvim", enabled = false },
	{ "ggandor/leap.nvim", enabled = false },
	{ "echasnovski/mini.surround", enabled = false },

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
	{ "vimwiki/vimwiki" },

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

	--
	-- UI
	--

	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"s1n7ax/nvim-window-picker",
			opts = {},
		},
		keys = {
			{ "<leader>o", "<cmd>lua Toggle_NeoTree_Focus()<CR>", desc = "Toggle NeoTree Focus" },
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
		"L3MON4D3/LuaSnip",
		-- "rafamadriz/friendly-snippets",
		config = function()
			local path = vim.fn.stdpath("config") .. "/snippets"

			-- require("luasnip.loaders.from_snipmate").lazy_load({
			-- 	paths = path,
			-- })
			-- require("luasnip.loaders.from_vscode").lazy_load({
			-- 	paths = path,
			-- })
			require("luasnip.loaders.from_lua").lazy_load({
				paths = path,
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
				-- "prettierd",
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
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
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
			},
		},
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
	-- 	"nvim-lualine/lualine.nvim",
	-- 	opts = {
	-- 		sections = {
	-- 			lualine_c = {
	-- 				{
	-- 					"diagnostics",
	-- 					symbols = {
	-- 						error = icons.diagnostics.Error,
	-- 						warn = icons.diagnostics.Warn,
	-- 						info = icons.diagnostics.Info,
	-- 						hint = icons.diagnostics.Hint,
	-- 					},
	-- 				},
	-- 				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
	-- 				{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
	-- 			},
	-- 		},
	-- 		winbar = {
	-- 			lualine_c = {
	-- 				{
	-- 					"filetype",
	-- 					icon_only = true,
	-- 					separator = "",
	-- 					padding = { left = 1, right = 0 },
	-- 					cond = function()
	-- 						navic.is_available()
	-- 					end,
	-- 				},
	-- 				{
	-- 					function()
	-- 						navic.get_location()
	-- 					end,
	-- 					cond = function()
	-- 						navic.is_available()
	-- 					end,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
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
