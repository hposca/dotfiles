" nvim-lint-settings
au BufWritePost <buffer> lua require('lint').try_lint()
