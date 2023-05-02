-- Telescope.nvim extension that adds LuaSnip integration.
return {
	"benfowler/telescope-luasnip.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("luasnip")
	end,
}
