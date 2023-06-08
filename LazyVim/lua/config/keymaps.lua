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

-- Deleting save file
del("i", "<C-s>")
del("v", "<C-s>")
del("n", "<C-s>")
-- del("s", "<C-s>")

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

-- Switch Plugin
map("n", "-", "<Plug>(Switch)", { desc = "Switch" })

-- Comment Plugin
map("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment toggle current line" })
map("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment toggle linewise (visual)" })

-- Buffer mappings
del("n", "<S-h>")
del("n", "<S-l>")

map("n", "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", { desc = "Find" })
map("n", "<leader>bj", "<cmd>BufferLinePick<cr>", { desc = "Jump" })
-- map("n", "<leader>b<", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to the left" })
-- map("n", "<leader>b>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to the right" })
map("n", "<leader>bE", "<cmd>BufferLinePickClose<cr>", { desc = "Pick which buffer to close" })
map("n", "<leader>bH", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close all to the left" })
map("n", "<leader>bL", "<cmd>BufferLineCloseRight<cr>", { desc = "Close all to the right" })
map("n", "<leader>by", "<cmd>BufferLineSortByDirectory<cr>", { desc = "Sort by director[y]" })
map("n", "<leader>bx", "<cmd>BufferLineSortByExtension<cr>", { desc = "Sort by e[x]tension" })
map("n", "<leader>bW", "<cmd>noautocmd w<cr>", { desc = "Save without formatting (noautocmd)" })

-- Copying improvements
map("n", "<leader>y", '"+y', { desc = "Copy to the + register" })
map("v", "<leader>y", '"+y', { desc = "Copy to the + register" })
map("n", "<leader>Y", '"+Y', { desc = "Copy to the + register" })
map("v", "<leader>Y", '"+Y', { desc = "Copy to the + register" })
map("v", "<leader>p", '"_dP', { desc = 'Do not lose the " register on paste' })

-- UndotreeToggle
map("n", "<leader>U", "<CMD>UndotreeToggle<CR>", { desc = "UndoTree Toggle" })

-- MarkdownPreview
map("n", "<leader>Mo", "<cmd>MarkdownPreview<cr>", { desc = "Open MarkdownPreview" })
map("n", "<leader>Ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop MarkdownPreview" })
map("n", "<leader>Mt", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle MarkdownPreview" })

-- Vim-EasyAlign
map("n", "ga", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
map("x", "ga", "<Plug>(EasyAlign)", { desc = "EasyAlign" })

-- Redefining default windows mappings to upper case w
del("n", "<leader>ww")
del("n", "<leader>wd")
del("n", "<leader>w-")
del("n", "<leader>w|")
map("n", "<leader>Ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>Wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>W-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>W|", "<C-W>v", { desc = "Split window right" })

-- More windows mappings
map("n", "Zz", "<C-w>_|<C-w>|", { desc = "Maximize windows" })
map("n", "Zo", "<C-w>=", { desc = "Restore windows sizes" })
map("n", "<leader>Wz", "<C-w>_|<C-w>|", { desc = "Maximize window" })
map("n", "<leader>Wo", "<C-w>=", { desc = "Restore windows sizes" })

-- Improved Code Folding
map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
map("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Fold less" })
map("n", "zm", require("ufo").closeFoldsWith, { desc = "Fold more" })
map("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek fold" })

-- Search Snippets
map("n", "<leader>fs", "<cmd>Telescope luasnip<CR>", { desc = "Search Snippets" })

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
	local venn_enabled = vim.inspect(vim.b.venn_enabled)
	if venn_enabled == "nil" then
		vim.b.venn_enabled = true
		vim.cmd([[setlocal ve=all]])
		-- draw a line on HJKL keystokes
		vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
		-- draw a box by pressing "f" with visual selection
		vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
		print("Venn Activated -- Don't forget to select text with blockwise-visual (Ctrl-v)")
	else
		vim.cmd([[setlocal ve=]])
		vim.cmd([[mapclear <buffer>]])
		vim.b.venn_enabled = nil
		print("Venn Deactivated")
	end
end

-- Toggle Venn
map("n", "<leader>V", "<cmd>lua Toggle_venn()<CR>", { desc = "Toggle Venn" })

-- Toggle diagnostic style, either below or on the same line
-- NOTE: Sometimes it causes issues with toggling the diagnostics in general
local below = false
function Toggle_diagnostics_text()
	below = not below
	if below then
		vim.diagnostic.config({
			virtual_lines = true, -- Virtual lines appear below the issue
			virtual_text = false, -- Diagnostic line do not appear on the same line as the issue
		})
		print("Diagnostic appears on the line below the issue")
	else
		vim.diagnostic.config({
			virtual_lines = false, -- Virtual lines do not appear below the issue
			virtual_text = true, -- Diagnostic line appears on the same line as the issue
		})
		print("Diagnostic appears on the same line as issue")
	end
end
map("n", "<leader>uD", "<cmd>lua Toggle_diagnostics_text()<CR>", { desc = "Toggle Diagnostics virtual text" })

-- Remapping for VimwikiIndex
-- Probably due to the loading order the deletion of the default `ww` causes an issue with it
map("n", "<leader>ww", "<cmd>VimwikiIndex<CR>", { desc = "Vimwiki Index" })

-- NeoTree toggle Focus
-- Based on AstroVim's
function Toggle_NeoTree_Focus()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd.Neotree("focus")
	end
end
-- map("n", "<leader>o", "<cmd>lua Toggle_NeoTree_Focus()<CR>", { desc = "Toggle NeoTree Focus" })
map("n", "<C-h>", "<cmd>lua Toggle_NeoTree_Focus()<CR>", { desc = "Toggle NeoTree Focus" })
