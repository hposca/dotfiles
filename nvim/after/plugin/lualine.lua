-- Set lualine as statusline
-- See `:help lualine.txt`
-- Themes can be found at https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
-- To check your current lualine configuration:
-- `:lua print(vim.inspect(require('lualine').get_config()))`

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox-material',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
    sections = {
        lualine_c = {
            {
                -- See `:help lualine-filename-component-options`
                'filename',
                path = 3,
            },
        }
    },
}
