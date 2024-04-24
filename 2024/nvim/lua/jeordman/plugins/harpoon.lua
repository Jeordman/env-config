local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function()
    print("Ctrl + 1 pressed")
    harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>j", function()
    print("Ctrl + 2 pressed")
    harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>k", function()
    print("Ctrl + 3 pressed")
    harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>l", function()
    print("Ctrl + 4 pressed")
    harpoon:list():select(4)
end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
--
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })


-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
