-- Configure switch
-- See `help switch.txt`
-- Tried to convert
-- let g:switch_mapping = "-"
-- to
vim.g.switch_mapping = "-"
-- but no success
-- This worked:
vim.keymap.set("n", "-", vim.cmd.Switch)
-- vim.g["switch_mapping"] = "-"

-- print("Hello before switch")
-- vim.cmd([[
--     let g:switch_mapping = "-"
-- ]])
-- print("Hello after switch")
