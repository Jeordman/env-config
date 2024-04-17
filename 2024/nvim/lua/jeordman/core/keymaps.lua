vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x"') -- dont add del chars

keymap.set("n", "<leader>+", "<C-a>") -- inc nums
keymap.set("n", "<leader>-", "<C-x>") -- dec nums

keymap.set("n", "<leader>sv", "<C-w>v") -- split vert
keymap.set("n", "<leader>sh", "<C-w>s") -- split horiz
keymap.set("n", "<leader>se", "<C-w>=") -- split equal
keymap.set("n", "<leader>sx", ":close<Cr>") -- close split
-- other window commands
vim.api.nvim_set_keymap("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hh", ":wincmd H<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j", ":wincmd j<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jj", ":wincmd J<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>k", ":wincmd k<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>kk", ":wincmd K<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ll", ":wincmd L<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>+", "10<C-w>+", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>-", "10<C-w>-", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><", "10<C-w><", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>>", "10<C-w>>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>=", "<C-w>=", { noremap = true })

-- plugin keymaps

-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<Cr>")

-- nvim tree
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_strings<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")


-- fugitive (git)
vim.api.nvim_set_keymap('n', '<leader>gs', ':G | only<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gd', ':vertical Gdiff<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gf', ':diffget //3<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gj', ':diffget //2<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gpu', ':Git push -u origin HEAD<cr>', {noremap = true, silent = true})

