local before = require('before')
before.setup()

-- Jump to previous entry in the edit history
vim.api.nvim_set_keymap('n', '<C-u>', "<cmd>lua require('before').jump_to_last_edit()<CR>", { noremap = true, silent = true })

-- Jump to next entry in the edit history
vim.api.nvim_set_keymap('n', '<C-i>', "<cmd>lua require('before').jump_to_next_edit()<CR>", { noremap = true, silent = true })

-- Look for previous edits in quickfix list
vim.api.nvim_set_keymap('n', '<leader>oq', "<cmd>lua require('before').show_edits_in_quickfix()<CR>", { noremap = true, silent = true })

-- Look for previous edits in telescope (assuming 'before' provides this functionality)
vim.api.nvim_set_keymap('n', '<leader>oe', "<cmd>lua require('before').show_edits_in_telescope()<CR>", { noremap = true, silent = true })
-- keymap.set('n', '<C-s>', '<cmd>Telescope before<CR>', function()
--   before.show_edits_in_telescope(require('telescope.themes').get_dropdown())
-- end)
--
vim.keymap.set('n', '<C-s>', function()
  before.show_edits_in_telescope(require('telescope.themes').get_dropdown())
end, {})
