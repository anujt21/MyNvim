return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons (optional but recommended)
		config = function()
			require("nvim-tree").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"python",
				"javascript",
				"typescript",
				"go",
				"rust",
				"html",
				"css",
				"bash",
				"json",
				"yaml",
				"markdown",
			},
			matchup = { enable = true },
			auto_install = true,
		},
	},
}
