return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				-- Disable virtual_text since it's redundant due to lsp_lines.
				virtual_text = false,
			},
		},
	},
}
