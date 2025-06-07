return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "¦" -- VSCode-like thin line
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = { "help", "dashboard", "lazy", "NvimTree", "Trouble" },
    },
  },
}
