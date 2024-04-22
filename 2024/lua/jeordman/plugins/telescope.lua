local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<C-k>"] = require('telescope.builtin').lsp_code_actions,
      },
    },
  },
})

telescope.load_extension("fzf")

