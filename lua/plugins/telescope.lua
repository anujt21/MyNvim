return {
        "nvim-telescope/telescope.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope-fzf-native.nvim", -- Optional but faster sorting
        },
        build = "make", -- Only for telescope-fzf-native
}

-- local telescope = require("telescope")
-- telescope.setup({
--   defaults = {
--     layout_strategy = "horizontal",
--     sorting_strategy = "ascending",
--     layout_config = {
--       prompt_position = "top",
--     },
--   },
--   pickers = {
--     find_files = {
--       hidden = true
--     }
--   },
--   extensions = {
--     fzf = {
--       fuzzy = true,
--       override_generic_sorter = true,
--       override_file_sorter = true,
--     }
--   }
-- })
--
-- -- Load extensions if available
-- pcall(telescope.load_extension, "fzf")

