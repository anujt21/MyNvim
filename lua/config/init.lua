vim.cmd.colorscheme("catppuccin")

-- Toggle number and relativenumber with ,n
vim.keymap.set("n", ",n", function()
  vim.wo.number = not vim.wo.number
end, { desc = "Toggle line numbers" })

-- Toggle relative number with .n
vim.keymap.set("n", ".n", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative line numbers" })
