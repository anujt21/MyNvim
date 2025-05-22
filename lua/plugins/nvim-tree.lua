return{
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons (optional but recommended)
      config = function()
        require("nvim-tree").setup()
      end,
  }
