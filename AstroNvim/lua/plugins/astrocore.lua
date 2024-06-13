---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        clipboard = "",
        listchars = { eol = "$", tab = "→ →", trail = "␣", extends = "…", space = "·" },
      },
    },
    mappings = {
      n = {
        ["<C-H>"] = false,
        -- ["<C-J>"] = false,
        -- ["<C-K>"] = false,
        ["<C-L>"] = false,
        ["<C-Up>"] = false,
        ["<C-Down>"] = false,
        ["<C-Left>"] = false,
        ["<C-Right>"] = false,
        ["<A-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
        ["<A-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
        ["<A-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
        ["<A-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
        ["<Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
        ["<Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
        ["<C-J>"] = "<Esc>o<Esc>k",
        ["<C-K>"] = "<Esc>O<Esc>j",
        -- Copying improvements
        ["<leader>y"] = { '"+y', desc = "Copy to the + register" },
        ["<leader>Y"] = { '"+Y', desc = "Copy to the + register" },
        ["<leader>fs"] = { "<cmd>Telescope luasnip<CR>", desc = "Search Snippets" },
        -- Centralize screen while scrolling and searching
        ["<C-f>"] = "<C-f>zz",
        ["<C-b>"] = "<C-b>zz",
        ["<C-d>"] = "<C-d>zz",
        ["<C-u>"] = "<C-u>zz",
        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
      },
      v = {
        -- Copying improvements
        ["<leader>y"] = { '"+y', desc = "Copy to the + register" },
        ["<leader>Y"] = { '"+Y', desc = "Copy to the + register" },
        ["<leader>p"] = { '"_dP', desc = 'Do not lose the " register on paste' },
      },
    },
  },
}
-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
--
-- -- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- -- Configuration documentation can be found with `:h astrocore`
-- -- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
-- --       as this provides autocomplete and documentation while editing
--
-- ---@type LazySpec
-- return {
--   "AstroNvim/astrocore",
--   ---@type AstroCoreOpts
--   opts = {
--     -- Configure core features of AstroNvim
--     features = {
--       large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
--       autopairs = true, -- enable autopairs at start
--       cmp = true, -- enable completion at start
--       diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
--       highlighturl = true, -- highlight URLs at start
--       notifications = true, -- enable notifications at start
--     },
--     -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
--     diagnostics = {
--       virtual_text = true,
--       underline = true,
--     },
--     -- vim options can be configured here
--     options = {
--       opt = { -- vim.opt.<key>
--         relativenumber = true, -- sets vim.opt.relativenumber
--         number = true, -- sets vim.opt.number
--         spell = false, -- sets vim.opt.spell
--         signcolumn = "yes", -- sets vim.opt.signcolumn to yes
--         wrap = false, -- sets vim.opt.wrap
--       },
--       g = { -- vim.g.<key>
--         -- configure global vim variables (vim.g)
--         -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
--         -- This can be found in the `lua/lazy_setup.lua` file
--       },
--     },
--     -- Mappings can be configured through AstroCore as well.
--     -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
--     mappings = {
--       -- first key is the mode
--       n = {
--         -- second key is the lefthand side of the map
--
--         -- navigate buffer tabs
--         ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
--         ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
--
--         -- mappings seen under group name "Buffer"
--         ["<Leader>bd"] = {
--           function()
--             require("astroui.status.heirline").buffer_picker(
--               function(bufnr) require("astrocore.buffer").close(bufnr) end
--             )
--           end,
--           desc = "Close buffer from tabline",
--         },
--
--         -- tables with just a `desc` key will be registered with which-key if it's installed
--         -- this is useful for naming menus
--         -- ["<Leader>b"] = { desc = "Buffers" },
--
--         -- setting a mapping to false will disable it
--         -- ["<C-S>"] = false,
--       },
--     },
--   },
-- }
