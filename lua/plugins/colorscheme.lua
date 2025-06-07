return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		priority = 900,
	},
	{
		"morhetz/gruvbox",
		lazy = true,
		priority = 800,
		config = function()
			vim.cmd.colorscheme("gruvbox")
			require("at.highlights")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 700,
		opts = {},
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("carbonfox")
		end,
	},
  {
  "loctvl842/monokai-pro.nvim",
  config = function()
      require("monokai-pro").setup()
  end
  },
}
