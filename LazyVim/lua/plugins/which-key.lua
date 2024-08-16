return {
	"folke/which-key.nvim",
	opts = {
		spec = {
			mode = { "n", "v" },
			["<leader>M"] = { name = "+MarkdownPreview" },
			["<leader>W"] = { name = "+Windows" },
			["<leader>w"] = { name = "+VimWiki" },
		},
	},
}
