-- Neovim plugin for splitting/joining blocks of code
return {
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
}
