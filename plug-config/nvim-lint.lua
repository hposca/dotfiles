-- au BufWritePost <buffer> lua require('lint').try_lint()
vim.api.nvim_command [[autocmd BufWritePost <buffer> lua require('lint').try_lint()]]

-- Setup nvim-lint
-- require('lint').linters.tflint = {
--   cmd = 'tflint',
--   stdin = true,
--   args = {},
--   stream = nil,
--   ignore_exitcode = false,
--   env = nil,
-- }

-- https://github.com/mfussenegger/nvim-lint#available-linters
require('lint').linters_by_ft = {
  go = {'golangcilint',},

-- npm install -g markdownlint-cli
-- go install github.com/errata-ai/vale@latest
-- Then create a ~/.vale.ini file as in https://docs.errata.ai/vale/cli#valeini
  markdown = {'markdownlint','vale',},

  python = {'pylint',},

  sh = {'shellcheck',},

  -- tf = {'tflint',},
}
