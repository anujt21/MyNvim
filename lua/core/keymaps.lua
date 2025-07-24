vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Accelerate j and k
vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})

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

-- Nvim Tree
vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Numbering
vim.keymap.set("n", ",n", function()
	vim.wo.number = not vim.wo.number
end, { desc = "Toggle line numbers" })
vim.keymap.set("n", ".n", function()
	vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative line numbers" })

-- Map alt + h,j,k,l to left, down, up, right in insert mode
vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-7>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-8>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-9>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<C-0>", "<Right>", { desc = "Move right" })

-- Endline insert in insert mode
vim.keymap.set("i", "<A-a>", "<C-o>A", { desc = "Endline insert" })

-- Change/delete buffer
vim.keymap.set("n", "H", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "L", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bb", "<cmd>BufferLinePickClose<CR>", { desc = "Pick & Close Buffer" })

-- Keymap for deleting without copying
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Keymap for pasting
vim.keymap.set("n", "<leader>p", "o<ESC>P", { desc = "Paste in next line" })

-- Keymaps for replacing
vim.keymap.set("n", "<leader>r", function()
	vim.opt.operatorfunc = "v:lua.DeleteAndPaste"
	return "g@"
end, { expr = true, desc = "Delete (no yank) and paste previous yank" })

-- Replace function
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

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Harpoon setup
local harpoon = require("harpoon")

-- REQUIRED
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-s-p>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-s-n", function()
	harpoon:list():next()
end)
