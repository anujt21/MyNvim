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
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer", -- Around function (vaf/yaf)
            ["if"] = "@function.inner", -- Inside function (vif/yif)
            -- Other useful text objects:
            ["ac"] = "@class.outer",   -- Around class (vac/yac)
            ["ic"] = "@class.inner",    -- Inside class (vic/yic)
          },
        },
      },
			matchup = { enable = true },
			auto_install = true,
		},
	},
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
  },
}
