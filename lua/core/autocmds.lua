-- Function to add a semicolon at the end of the line if missing, and if not a comment
local function add_semicolon()
  local line = vim.api.nvim_get_current_line()

  -- Skip if the line is a comment (single-line comments or block comments)
  if line:match("^%s*//") or line:match("^%s*/%*") then
    return
  end

  -- Check if line doesn't end with a semicolon
  if not line:match(";[%s]*$") then
    vim.api.nvim_set_current_line(line .. ";")
  end
end

-- Auto command group to handle normal and insert mode
vim.api.nvim_create_augroup('AutoAddSemicolon', { clear = true })

-- Define the file types where semicolons are required
local filetypes = { "c", "cc", "cpp", "h", "hpp" }

-- Add semicolon when leaving insert mode or after creating a new line (for code files)
-- vim.api.nvim_create_autocmd('InsertLeave', {
--   group = 'AutoAddSemicolon',
--   pattern = "*",
--   callback = function()
--     -- Apply only for the specified file types
--     if vim.fn.index(filetypes, vim.bo.filetype) ~= -1 then
--       add_semicolon()
--     end
--   end
-- })

