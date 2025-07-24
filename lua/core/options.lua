vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#a6e22e", bold = true })

-- Set any default colorscheme
-- vim.cmd.colorscheme("carbonfox")
vim.cmd.colorscheme("kanagawa")
