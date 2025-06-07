return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Add more here as needed
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				return not vim.b[bufnr].disable_autoformat
			end,
			-- Optional: use stylua from Mason
			formatters = {
				stylua = {
					command = vim.fn.stdpath("data") .. "/mason/bin/stylua",
				},
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
}
