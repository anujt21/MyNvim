return {
  -- Configure LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
            "--completion-style=detailed",
            "--all-scopes-completion",
            "--pch-storage=memory",
            "--offset-encoding=utf-16", -- Important for fixing offset encoding issues
          },
          init_options = {
            fallbackFlags = { "-std=c++17" }, -- Adjust standard as needed
          },
        },
      },
    },
  },
}
