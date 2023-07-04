local cmp = require("cmp")

return {
	"hrsh7th/nvim-cmp",

	opts = {
		mapping = cmp.mapping.preset.insert({
			["<tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
	},
}
