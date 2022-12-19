-- Configure tmux-navigator
-- See `:help tmux-navigator.txt`
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<M-h>", vim.cmd.TmuxNavigateLeft, opts)
vim.keymap.set("n", "<M-j>", vim.cmd.TmuxNavigateDown, opts)
vim.keymap.set("n", "<M-k>", vim.cmd.TmuxNavigateUp, opts)
vim.keymap.set("n", "<M-l>", vim.cmd.TmuxNavigateRight, opts)
