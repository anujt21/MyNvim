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
