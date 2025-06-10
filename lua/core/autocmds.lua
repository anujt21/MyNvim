-- Function to add a semicolon at the end of the line if missing, and if not a comment
local function add_semicolon()
	local line = vim.api.nvim_get_current_line()

	-- Skip if the line is a comment (single-line comments or block comments)
	if line:match("^%s*//") or line:match("^%s*/%*") then
		return
	end

	-- Check if line doesn't end with a semicolon
	if not line:match(";[%s]*$") then
		vim.api.nvim_set_current_line(line .. ";")
	end
end

-- Auto command group to handle normal and insert mode
vim.api.nvim_create_augroup("AutoAddSemicolon", { clear = true })

-- Define the file types where semicolons are required
local filetypes = { "c", "cc", "cpp", "h", "hpp" }

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
