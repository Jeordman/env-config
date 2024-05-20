local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {

		-- local conf = require('telescope.config').values
		-- require('telescope.builtin').live_grep {
		--   vimgrep_arguments = table.insert(conf.vimgrep_arguments, '--fixed-strings'),
		-- }
		pickers = {
			-- live_grep = {
			--   vimgrep_arguments = {
			--     "--fixed-strings",
			--   },
			-- },
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<c-d>"] = actions.delete_buffer + actions.move_to_top,
				-- ["<C-k>"] = require('telescope.builtin').lsp_code_actions,
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
