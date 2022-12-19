-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local builtin = require('telescope.builtin')


require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = "move_selection_previous",
        ['<C-j>'] = "move_selection_next",
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>o', builtin.oldfiles, { desc = 'Find recently [O]pened files' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find existing [B]uffers' })

vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search git managed files' })
