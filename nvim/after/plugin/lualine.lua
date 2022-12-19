-- Set lualine as statusline
-- See `:help lualine.txt`
-- Themes can be found at https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox-material',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
    },
}
