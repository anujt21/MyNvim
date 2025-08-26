return {
	"mason-org/mason.nvim",
	"mason-org/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			-- Your setup opts here
		},
	},
	"simrat39/rust-tools.nvim",
}
