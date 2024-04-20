local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recc settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#886ebc ]])
-- vim.cmd([[ highlight NvimTree guifg=#886ebc ]])

nvimtree.setup({
  renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "", -- arrow when folder is closed
            arrow_open = "", -- arrow when folder is open
          },
        },
      },
    },
  filters = {
    dotfiles = true,
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
