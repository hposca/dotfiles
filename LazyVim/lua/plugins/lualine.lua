local navic = require("nvim-navic")

return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			winbar = {
				lualine_c = {
					{
						"filetype",
						icon_only = true,
						separator = "",
						padding = { left = 1, right = 0 },
						cond = function()
							return navic.is_available()
						end,
					},
					{
						function()
							return navic.get_location()
						end,
						cond = function()
							return navic.is_available()
						end,
					},
				},
			},
		},
	},
}
