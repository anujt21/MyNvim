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
    lazy = true,
    priority = 600,
    opts = {},
    config = function()
      vim.cmd.colorscheme("carbonfox")
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
    priority = 500,
    config = function()
      vim.cmd.colorscheme("monokai-pro-classic")
      require("monokai-pro").setup()
    end
  },
}
