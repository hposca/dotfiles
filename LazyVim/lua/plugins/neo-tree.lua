return {
	"nvim-neo-tree/neo-tree.nvim",
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
}
