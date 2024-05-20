vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")
-- keymap.set("n", "x", '"_x"') -- dont add del chars

-- keymap.set("n", "<leader>+", "<C-a>") -- inc nums
-- keymap.set("n", "<leader>-", "<C-x>") -- dec nums

keymap.set("n", "<leader>sv", "<C-w>v") -- split vert
keymap.set("n", "<leader>sh", "<C-w>s") -- split horiz
keymap.set("n", "<leader>se", "<C-w>=") -- split equal
keymap.set("n", "<leader>sx", ":close<Cr>") -- close split
-- other window commands
-- vim.api.nvim_set_keymap("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hh", ":wincmd H<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>j", ":wincmd j<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jj", ":wincmd J<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>k", ":wincmd k<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>kk", ":wincmd K<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ll", ":wincmd L<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>+", "10<C-w>+", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>-", "10<C-w>-", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader><", "10<C-w><", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>>", "10<C-w>>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>=", "<C-w>=", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.o.scroll = 5

-- plugin keymaps

-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<Cr>")

-- nvim tree
keymap.set("n", "<leader>b", ":NvimTreeFindFile<CR>")

-- telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-f>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
keymap.set("n", "<C-w>", ":Telescope resume<cr>", { noremap = true, silent = true })
keymap.set("n", "<C-s>", ":Telescope git_status<cr>", { noremap = true, silent = true })
keymap.set("n", "<C-c>", ":Telescope git_commits<cr>", { noremap = true, silent = true })
keymap.set("n", "<C-b>", ":Telescope git_branches<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gD", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })

-- fugitive (git)
vim.api.nvim_set_keymap("n", "<leader>gs", ":horizontal G | only<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gd", ":vertical Gdiff<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gf", ":diffget //3<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gj", ":diffget //2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gp", ":Git push<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gpu", ":Git push -u origin HEAD<cr>", { noremap = true, silent = true })

vim.o.scrolloff = 6

vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.statuscolumn = "%s %l %r "
