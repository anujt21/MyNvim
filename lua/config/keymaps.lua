-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map cntrl + j to enter in Insert Mode
vim.keymap.set("i", "<A-CR>", "<CR>", { desc = "Insert newline" })

-- Map cntrl + h,j,k,l to left, down, up, right in insert mode
vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move right" })

-- vim.keymap.set("i", "<A-k>", function()
--   vim.lsp.buf.signature_help()
-- end, { desc = "Signature help" })
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

-- Harpoon keymaps
-- local harpoon = require("harpoon")
-- harpoon:setup()
--
-- vim.keymap.set("n", "<leader>a", function()
--   harpoon:list():add()
-- end)
-- vim.keymap.set("n", "<C-e>", function()
--   harpoon.ui.toggle_quick_menu(harpoon:list())
-- end)
-- vim.keymap.set("n", "<C-h>", function()
--   harpoon:list():select(1)
-- end)
-- vim.keymap.set("n", "<C-j>", function()
--   harpoon:list():select(2)
-- end)
-- vim.keymap.set("n", "<C-k>", function()
--   harpoon:list():select(3)
-- end)
-- vim.keymap.set("n", "<C-l>", function()
--   harpoon:list():select(4)
-- end)
