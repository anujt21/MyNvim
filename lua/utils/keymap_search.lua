-- keymap_search.lua
local M = {}

local keymaps = {
  { lhs = "<leader>ff", desc = "Find Files", cmd = "Telescope find_files" },
  { lhs = "<leader>fg", desc = "Live Grep",   cmd = "Telescope live_grep" },
  { lhs = "<leader>fb", desc = "Buffers",     cmd = "Telescope buffers" },
}

function M.show()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  pickers.new({}, {
    prompt_title = "My Keymaps",
    finder = finders.new_table {
      results = vim.tbl_map(function(map)
        return {
          display = string.format("%s → %s", map.lhs, map.desc),
          value = map,
        }
      end, keymaps),
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd(selection.value.cmd)
      end)
      return true
    end,
  }):find()
end

return M

