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

require("lualine").setup({
	options = { theme = "dracula" },
})

-- LSP config

-- Set key mappings after lspconfig setup
local on_attach = function(client, bufnr)

	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

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
	cmd = {
		"clangd",
		"--compile-commands-dir=.",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=never",
		"--offset-encoding=utf-16",
		"--limit-references=0",
		"--limit-results=0",
		"--completion-style=detailed",
		"--fallback-style=llvm",
		"--suggest-missing-includes",
	},
	init_options = {
		fallbackFlags = {
			"-Wno-unknown-argument",
			"--gcc-toolchain=/opt/nxp-real-time-edge/2.8/environment-setup-armv8a-poky-linux", 
		},
	},
	on_attach = on_attach,
})

-- Python LSP (pylsp)
require("lspconfig").pylsp.setup{
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {enabled = false},
				mccabe = {enabled = false},
				pyflakes = {enabled = false},
				pylsp_mypy = {enabled = true},
				pylsp_black = {enabled = true},
				pylsp_isort = {enabled = true},
			}
		}
	}
}

-- Rust LSP
require("lspconfig").rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			checkOnSave = {
				command = "clippy"
			},
		},
	},
})

-- Rust tools
require('rust-tools').setup({
	server = {
		on_attach = function(_, bufnr)
			local opts = { noremap=true, silent=true, buffer=bufnr }
			vim.keymap.set("n", "<leader>rh", "<cmd>RustHoverActions<CR>", opts)
			vim.keymap.set("n", "<leader>rr", "<cmd>RustRunnables<CR>", opts)
		end,
	},
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
