vim.api.nvim_create_user_command("UseGruvbox", function()
	require("lazy").load({ plugins = { "gruvbox" } })
end, {})

vim.api.nvim_create_user_command("UseTokyo", function()
	vim.cmd.colorscheme("tokyonight-night")
end, {})

vim.api.nvim_create_user_command("UseCat", function()
	vim.cmd.colorscheme("catppuccin-mocha")
end, {})

vim.api.nvim_create_user_command("UseCatLight", function()
	vim.cmd.colorscheme("catppuccin-latte")
end, {})
