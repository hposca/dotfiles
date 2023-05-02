return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				-- Disable by default, let the user choose which style is prefered, same line as default
				virtual_text = true,
				virtual_lines = false,
			},
		},
	},
}
