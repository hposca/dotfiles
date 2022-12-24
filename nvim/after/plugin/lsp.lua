local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"sumneko_lua",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

vim.keymap.set("i", "<Tab>", function()
	return vim.fn.pumvisible() == 1 and "<C-N>" or "<Tab>"
end, { expr = true })

lsp.set_preferences({
	suggest_lsp_servers = false,
})

-- lsp.on_attach(function(client, bufnr)
--     local opts = { buffer = bufnr, remap = false }
--
--     vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
--     vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, opts)
--     vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
--     vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, opts)
--     vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
--     vim.keymap.set("n", "<leader>lw", vim.lsp.buf.workspace_symbol, opts)
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--     vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- end)

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, remap = false })
	end
	local builtin = require("telescope.builtin")

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-h>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")
end

--[[ Format current buffer with LSP ]]
local format = function()
	if vim.lsp.buf.format then
		vim.lsp.buf.format()
	elseif vim.lsp.buf.formatting then
		vim.lsp.buf.formatting()
	end
end
vim.keymap.set("n", "<leader>f", format)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

require("fidget").setup({})
