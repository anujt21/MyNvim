return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Glog", "Gedit" },
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", desc = "Git status (fugitive)" },
    },
  },
}
