-- Setup nvim-lint
-- https://github.com/mfussenegger/nvim-lint#available-linters
require('lint').linters_by_ft = {
  go = {'golangcilint',},
-- npm install -g markdownlint-cli
-- go install github.com/errata-ai/vale@latest
-- Then create a ~/.vale.ini file as in https://docs.errata.ai/vale/cli#valeini
  markdown = {'markdownlint','vale',},
  python = {'pylint',},
-- go install mvdan.cc/sh/v3/cmd/shfmt@latest
  sh = {'shellcheck',},
  terraform = {'tflint',},
}
