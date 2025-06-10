return {
        "nvim-telescope/telescope.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",        -- Required
          "nvim-telescope/telescope-fzf-native.nvim", -- Optional but faster sorting
        },
        build = "make", -- Only for telescope-fzf-native
}
