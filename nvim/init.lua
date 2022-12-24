require("hposca")

-- Required to load this early or else the default mappings CTRL-hjkl persisted
vim.g["tmux_navigator_no_mappings"] = 1 -- Custom Key Bindings

-- Configurations for nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
