return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "BufReadPost", "InsertLeave" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				fish = { "fish" },
				-- uncomment and add others as needed
				-- lua = { "selene" },
				-- ["*"] = { "typos" },
				-- ["_"] = { "fallback_linter" },
			}

			local function debounce(ms, fn)
				local timer = vim.loop.new_timer()
				return function(...)
					local argv = { ... }
					timer:start(ms, 0, function()
						timer:stop()
						vim.schedule(function()
							fn(unpack(argv))
						end)
					end)
				end
			end

			local function do_lint()
				local ft = vim.bo.filetype
				local linters = lint._resolve_linter_by_ft(ft)
				if #linters == 0 then
					linters = lint.linters_by_ft["_"] or {}
				end
				vim.list_extend(linters, lint.linters_by_ft["*"] or {})

				linters = vim.tbl_filter(function(name)
					local linter = lint.linters[name]
					if not linter then
						vim.notify("nvim-lint: Linter not found: " .. name, vim.log.levels.WARN)
						return false
					end
					if type(linter) == "table" and linter.condition then
						return linter.condition({ filename = vim.api.nvim_buf_get_name(0) })
					end
					return true
				end, linters)

				if #linters > 0 then
					lint.try_lint(linters)
				end
			end

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = debounce(100, do_lint),
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = false,
		opts = {
			formatters_by_ft = {
				cpp = { "clang_format" },
				c = { "clang_format" },
				lua = { "stylua" },
			},
			format_on_save = false,
      format_after_save = false,
		},
	},
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
        },
      })
    end,
  },
}
