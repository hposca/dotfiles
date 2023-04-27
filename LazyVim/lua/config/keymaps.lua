-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local del = vim.api.nvim_del_keymap

local function map(mode, lhs, rhs, opts)
	local keys = require("lazy.core.handler").handlers.keys
	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- Deleting default resizing
del("n", "<C-Up>") -- "Increase window height"
del("n", "<C-Down>") -- "Decrease window height"
del("n", "<C-Left>") -- "Decrease window width"
del("n", "<C-Right>") -- "Increase window width"

-- Resizing with arrows
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Deleting default move lines
del("n", "<A-j>") -- "Move down"
del("i", "<A-j>") -- "Move down"
del("v", "<A-j>") -- "Move down"
del("n", "<A-k>") -- "Move up"
del("i", "<A-k>") -- "Move up"
del("v", "<A-k>") -- "Move up"

-- Deleting default move to window using the <ctrl> hjkl keys
del("n", "<C-h>") -- "Go to left window"
del("n", "<C-j>") -- "Go to lower window"
del("n", "<C-k>") -- "Go to upper window"
del("n", "<C-l>") -- "Go to right window"

-- Redefining C- keys
map("n", "<C-j>", "<Esc>o<Esc>", { desc = "Insert new line below" })
map("n", "<C-k>", "<Esc>O<Esc>", { desc = "Insert new line above" })
map("n", "<C-l>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight search" })

-- Navigating through windows
map("n", "<A-h>", "<CMD>NavigatorLeft<CR>", { desc = "Go to left window" })
map("n", "<A-j>", "<CMD>NavigatorDown<CR>", { desc = "Go to lower window" })
map("n", "<A-k>", "<CMD>NavigatorUp<CR>", { desc = "Go to upper window" })
map("n", "<A-l>", "<CMD>NavigatorRight<CR>", { desc = "Go to right window" })
map("n", "<A-p>", "<CMD>NavigatorPrevious<CR>", { desc = "Go to previous window" })
