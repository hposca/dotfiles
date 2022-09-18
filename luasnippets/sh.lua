return {
	s({ trig = "sbash", dscr = "Safe bash mode" }, {
		t({ "#!/usr/bin/env bash", "" }),
		t({ "set -euo pipefail", "" }),
		t({ "IFS=$'\\n\\t'", "" }),
		t({ "", "" }), -- Linebreak
		i(0),
	}),
}
