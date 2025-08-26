-- theme & transparency
vim.cmd.colorscheme("kanagawa")
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#a6e22e", bold = true })


-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- Indentation
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.tabstop = 8
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.clipboard = "unnamedplus"

-- Folding settings
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
