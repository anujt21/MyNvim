vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("core.plugins")
require("core.options")
require("core.keymaps")
require("core.telescope")
require("core.autocmds")

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("catppuccin").setup {
    integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = false,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
        }

}

require("lualine").setup{
    options = {theme = 'onelight'}
}
-- LSP config
require'lspconfig'.clangd.setup{}

-- Set key mappings after lspconfig setup
local on_attach = function(client, bufnr)
  -- Go to definition
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
  
  -- Go to declaration
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
  
  -- Go to references
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
  
  -- Hover docs
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
  
  -- Rename symbol
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
  
  -- Signature help (optional)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>sh', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
end

-- Setup for C/C++ using clangd or ccls
require("lspconfig").clangd.setup {
  on_attach = on_attach,
}

-- Bufferline plugin
require("bufferline").setup{}

-- Trouble plugin
require("trouble").setup{}
