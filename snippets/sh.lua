-- Creating a new snippet based on the examples at https://github.com/L3MON4D3/LuaSnip/blob/8f2bf6b0e3/Examples/snippets.lua
-- LuaSnip documentation can be found at https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
--
-- All available names:
--
-- local ls = require("luasnip")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local c = ls.choice_node
-- local conds = require("luasnip.extras.expand_conditions")
-- local d = ls.dynamic_node
-- local dl = extras.dynamic_lambda
-- local events = require("luasnip.util.events")
-- local extras = require("luasnip.extras")
-- local f = ls.function_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local i = ls.insert_node
-- local isn = ls.indent_snippet_node
-- local l = extras.lambda
-- local m = extras.match
-- local n = extras.nonempty
-- local p = extras.partial
-- local parse = require("luasnip.util.parser").parse_snippet
-- local postfix = require("luasnip.extras.postfix").postfix
-- local r = ls.restore_node
-- local rep = extras.rep
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local types = require("luasnip.util.types")

package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/snippets/?.lua" .. ";"

local h = require("helpers")

return {
	s({ trig = "sbash", dscr = "Safe bash mode" }, {
		t({
			"#!/usr/bin/env bash",
			"set -euo pipefail",
			"IFS=$'\\n\\t'",
			"",
			"", -- Linebreak
		}),
		i(0),
	}),
	s({ trig = "generic", dscr = "Creates a generic bash script" }, {
		t(h.from_file("generic.sh")),
		t({ "", "" }),
	}),
	s({ trig = "ff", dscr = "Function definition" }, {
		t("function "),
		i(1, "function_name"),
		t("() {"),
		t({ "", "" }), -- Linebreak
		t("  "),
		i(0),
		t({ "", "" }), --Linebreak
		t("}"),
	}),
	s({ trig = "arr", dscr = "Declares an array" }, {
		t("declare -a "),
		i(1, "array_name"),
		t({ "", "" }), -- Linebreak
		rep(1),
		t("=("),
		i(0),
		t(")"),
	}),
}
