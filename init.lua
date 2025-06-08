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
			package_uninstalled = "✗",
		},
	},
})

require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

require("ufo").setup()

require("catppuccin").setup({
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
	},
})

require("lualine").setup({
	options = { theme = "dracula" },
})

-- LSP config
require("lspconfig").clangd.setup({})

-- Set key mappings after lspconfig setup
local on_attach = function(client, bufnr)
	-- Go to definition
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gd",
		"<Cmd>lua vim.lsp.buf.definition()<CR>",
		{ noremap = true, silent = true }
	)

	-- Go to declaration
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gD",
		"<Cmd>lua vim.lsp.buf.declaration()<CR>",
		{ noremap = true, silent = true }
	)

	-- Go to references
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gr",
		"<Cmd>lua vim.lsp.buf.references()<CR>",
		{ noremap = true, silent = true }
	)

	-- Hover docs
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

	-- Rename symbol
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>rn",
		"<Cmd>lua vim.lsp.buf.rename()<CR>",
		{ noremap = true, silent = true }
	)

	-- Signature help (optional)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>sh",
		"<Cmd>lua vim.lsp.buf.signature_help()<CR>",
		{ noremap = true, silent = true }
	)
end

-- Setup for C/C++ using clangd or ccls
require("lspconfig").clangd.setup({
	on_attach = on_attach,
})

-- Bufferline plugin
require("bufferline").setup({})

-- Trouble plugin
require("trouble").setup({})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "cpp", "c" }, -- Add more as needed
	highlight = {
		enable = true, -- THIS enables it by default
		additional_vim_regex_highlighting = false,
	},
})



-- REQUIRED
require("harpoon").setup({})
