return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 700,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "morhetz/gruvbox",
    lazy = true,
    priority = 600,
    config = function()
      vim.cmd.colorscheme("gruvbox")
      require("at.highlights")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 800,
    opts = {},
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 900,
    opts = {},
    config = function()
      vim.cmd.colorscheme("carbonfox")
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("monokai-pro-classic")
      require("monokai-pro").setup()
    end
  },
	{
		"rktjmp/lush.nvim",
	},
}
