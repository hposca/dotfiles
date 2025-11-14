-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local del = vim.keymap.del
-- local map = vim.keymap.set

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
map("i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Correcting spelling mistakes on the fly" })

-- Redefining C- keys
map("n", "<C-j>", "<Esc>o<Esc>k", { desc = "Insert new line below" })
map("n", "<C-k>", "<Esc>O<Esc>j", { desc = "Insert new line above" })
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

map("n", "<leader>B", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Find Files (root dir)" })

map("n", "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", { desc = "Find" })
map("n", "<leader>bj", "<cmd>BufferLinePick<cr>", { desc = "Jump" })
-- map("n", "<leader>b<", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to the left" })
-- map("n", "<leader>b>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to the right" })
map("n", "<leader>bE", "<cmd>BufferLinePickClose<cr>", { desc = "Pick which buffer to close" })
map("n", "<leader>bH", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close all to the left" })
map("n", "<leader>bL", "<cmd>BufferLineCloseRight<cr>", { desc = "Close all to the right" })
map("n", "<leader>by", "<cmd>BufferLineSortByDirectory<cr>", { desc = "Sort by director[y]" })
map("n", "<leader>bx", "<cmd>BufferLineSortByExtension<cr>", { desc = "Sort by e[x]tension" })
map("n", "<leader>bw", "<cmd>noautocmd w<cr>", { desc = "Save without formatting (noautocmd)" })

-- Copying improvements
map("n", "<leader>y", '"+y', { desc = "Copy to the + register" })
map("v", "<leader>y", '"+y', { desc = "Copy to the + register" })
map("n", "<leader>Y", '"+Y', { desc = "Copy to the + register" })
map("v", "<leader>Y", '"+Y', { desc = "Copy to the + register" })
map("v", "<leader>p", '"_dP', { desc = 'Do not lose the " register on paste' })

-- Centralize screen while scrolling and searching
map("n", "<C-f>", "<C-f>zz") -- not working (LazyVim config, Probably)
map("n", "<C-b>", "<C-b>zz") -- not working (LazyVim config, Probably)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- UndotreeToggle
map("n", "<leader>U", "<CMD>UndotreeToggle<CR>", { desc = "UndoTree Toggle" })

-- MarkdownPreview
map("n", "<leader>M", "", { desc = "MarkdownPreview" })
map("n", "<leader>Mo", "<cmd>MarkdownPreview<cr>", { desc = "Open MarkdownPreview" })
map("n", "<leader>Ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop MarkdownPreview" })
map("n", "<leader>Mt", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle MarkdownPreview" })

-- Vim-EasyAlign
map("n", "ga", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
map("x", "ga", "<Plug>(EasyAlign)", { desc = "EasyAlign" })

-- Redefining default windows mappings to upper case w
-- del("n", "<leader>ww")
del("n", "<leader>wd")
-- del("n", "<leader>w-")
-- del("n", "<leader>w|")
map("n", "<leader>Ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>Wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>W-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>W|", "<C-W>v", { desc = "Split window right" })

-- More windows mappings
map("n", "Zz", "<C-w>_|<C-w>|", { desc = "Maximize windows" })
map("n", "Zo", "<C-w>=", { desc = "Restore windows sizes" })
map("n", "<leader>Wz", "<C-w>_|<C-w>|", { desc = "Maximize window" })
map("n", "<leader>Wo", "<C-w>=", { desc = "Restore windows sizes" })

-- -- Improved Code Folding
-- map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
-- map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
-- map("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Fold less" })
-- map("n", "zm", require("ufo").closeFoldsWith, { desc = "Fold more" })
-- map("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek fold" })

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

-- Tab switching
map("n", "]T", "<cmd>tabnext<CR>", { desc = "Tab Next" })
map("n", "[T", "<cmd>tabprevious<CR>", { desc = "Tab Next" })

-- Vertical Tag openning
-- C-]         Jump to definition in the same file
-- C-W C-]     Jump to definition in a horizontal split
-- C-W C-V C-] Jump to definition in a vertical split
map("n", "<C-W><C-V><C-]>", "<cmd>vert winc ]<CR>")

---
---
--- Configuring Obsidian Plugin
--- This should have been its own file but my Lua-foo is not strong right now and
--- I wasn't able to make the mapping invoke the function in another file :/
---
---

--- Configuration based on https://gitlab.com/shastenm/dotfiles/-/blob/main/.config/nvim-configs/astro/lua/done.lua

--- Lua function to expand the tilde (~) to the user's home directory
local function expand_home_directory(path)
	local home = os.getenv("HOME")
	if home then
		return path:gsub("~", home)
	else
		return path
	end
end

-- Define the file paths with the expanded home directory
local todo_file = expand_home_directory("~/vimwiki/tasks-todo.md")
local done_file = expand_home_directory("~/vimwiki/tasks-done.md")

-- Function to check if a line contains a "done" task
local function is_done_task(line)
	return line:match("%[x%]") ~= nil -- Checks for "[x]" which indicates a completed task
end

-- Function to process the TODO file
local function move_done_tasks()
	-- Open the TODO file
	local todo = io.open(todo_file, "r")
	if not todo then
		print("Error: Could not open " .. todo_file)
		return
	end

	-- Open the DONE file in append mode
	local done = io.open(done_file, "a")
	if not done then
		print("Error: Could not open " .. done_file)
		return
	end

	-- Read each line from the TODO file
	local remaining_lines = {}
	for line in todo:lines() do
		if is_done_task(line) then
			-- If the task is completed, move it to the DONE file
			done:write(line .. "\n")
		else
			-- Otherwise, keep the line in the remaining lines list
			table.insert(remaining_lines, line)
		end
	end

	-- Close the TODO and DONE files
	todo:close()
	done:close()

	-- Rewrite the TODO file without completed tasks
	local todo_rewrite = io.open(todo_file, "w")
	if not todo_rewrite then
		print("Error: Could not open " .. todo_file .. " for writing")
		return
	end

	for _, line in ipairs(remaining_lines) do
		todo_rewrite:write(line .. "\n")
	end

	todo_rewrite:close()
	print("Finished moving completed tasks to DONE.md.")
end

-- Keybindings

map("n", "<leader>O", "", { desc = "Obsidian" })
map("n", "<leader>OO", "<cmd>ObsidianOpen<CR>", { desc = "Open a note in the Obsidian app" })
map("n", "<leader>OR", "<cmd>ObsidianRename<CR>", { desc = "Rename current buffer or reference under the cursor" })
map("n", "<leader>Oi", "<cmd>edit ~/vimwiki/index.md<CR>", { desc = "Obsidian Index" })
map("n", "<leader>Op", "<cmd>ObsidianPasteImg<CR>", { desc = "Paste an image from the clipboard" })

map("n", "<leader>Of", "", { desc = "Find" })
map("n", "<leader>OfT", "<cmd>ObsidianTemplate<CR>", { desc = "List/Insert template" })
map("n", "<leader>Ofb", "<cmd>ObsidianBacklinks<CR>", { desc = "List of references to the current buffer" })
map("n", "<leader>Ofd", "<cmd>ObsidianDailies<CR>", { desc = "List/Insert of daily notes" })
map("n", "<leader>Off", "<cmd>ObsidianSearch<CR>", { desc = "Search for notes in your vault" })
map("n", "<leader>Ofl", "<cmd>ObsidianLinks<CR>", { desc = "List of links within the current buffer" })
map("n", "<leader>Ofo", "<cmd>ObsidianTOC<CR>", { desc = "List the table of contents" })
map("n", "<leader>Ofs", "<cmd>ObsidianSearch<CR>", { desc = "Search for notes in your vault" })
map("n", "<leader>Oft", "<cmd>ObsidianTags<CR>", { desc = "List/Insert tags" })

map("n", "<leader>On", "", { desc = "Notes" })
map("n", "<leader>Onn", "<cmd>ObsidianNew<CR>", { desc = "Create a new note" })
map("n", "<leader>Ono", "<cmd>ObsidianTomorrow<CR>", { desc = "Open/create a tomorrow daily note. " })
map("n", "<leader>Ons", "<cmd>ObsidianSearch<CR>", { desc = "Search for notes in your vault" })
map("n", "<leader>Ont", "<cmd>ObsidianToday<CR>", { desc = "Open/create a daily note. " })
map("n", "<leader>Ony", "<cmd>ObsidianYesterday<CR>", { desc = "Open/create a yesterday daily note. " })

map("n", "<leader>Ot", "", { desc = "Tasks" })
map("n", "<leader>OtT", "<cmd>edit ~/vimwiki/tasks-todo.md<CR>", { desc = "Open TODO list" })
map("n", "<leader>Otd", "<cmd>edit ~/vimwiki/tasks-done.md<CR>", { desc = "Open DONE list" })
map("n", "<leader>Otz", move_done_tasks, { desc = "Move completed tasks to DONE" })

-- Jump to buffer movements
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Buffer 6" })
map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Buffer 7" })
map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Buffer 8" })
map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Buffer 9" })
-- Go to last buffer
map("n", "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", { desc = "Buffer -1" })

---
--- /Obsidian
---
