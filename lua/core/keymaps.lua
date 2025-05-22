vim.g.mapleader = " "

local keymap = vim.keymap.set
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<leader>q", vim.diagnostic.setloclist)

-- Telescope keymaps (lazy-loaded)
keymap("n", "<leader><leader>", function()
	require("telescope.builtin").find_files()
end)
keymap("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end)
keymap("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end)
keymap("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end)

vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Numbering
vim.keymap.set("n", ",n", function()
	vim.wo.number = not vim.wo.number
end, { desc = "Toggle line numbers" })
vim.keymap.set("n", ".n", function()
	vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative line numbers" })

-- Map cntrl + h,j,k,l to left, down, up, right in insert mode
vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-a>", "<C-o>A", { desc = "Endline insert" })
-- Change buffer
vim.keymap.set("n", "H", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "L", ":bnext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>bC", "<cmd>BufferLinePickClose<CR>", { desc = "Pick & Close Buffer" })

-- Keymap for deleting without copying
vim.keymap.set("n", "<leader>D", '"_d', { desc = "Delete without yanking" })

-- Keymap for pasting
vim.keymap.set("n", "<leader>p", 'o<ESC>"0P', { desc = "Paste in next line" })

-- Keymaps for replacing
vim.keymap.set("n", "<leader>r", function()
	vim.opt.operatorfunc = "v:lua.DeleteAndPaste"
	return "g@"
end, { expr = true, desc = "Delete (no yank) and paste previous yank" })

_G.DeleteAndPaste = function(type)
	local save_cursor = vim.fn.getcurpos()
	if type == "char" then
		vim.cmd([[normal! `[v`]"_d]])
	elseif type == "line" then
		vim.cmd([[normal! '[V']"_d]])
	elseif type == "block" then
		vim.cmd([[normal! `[<C-V>`]"_d]])
	else
		return
	end
	vim.cmd([[normal! P]])
	vim.fn.setpos(".", save_cursor)
end
