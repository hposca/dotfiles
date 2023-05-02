return {
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
}
