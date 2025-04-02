return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Ensure plenary is available
    'nvim-tree/nvim-web-devicons', -- Optional, for icons
    'MunifTanjim/nui.nvim', -- Required by neo-tree
  },
  cmd = 'Neotree', -- Lazy-load on `:Neotree` command
  keys = {
    {
      '<leader>b',
      function()
        require('neo-tree.command').execute { toggle = true, reveal = true, position = 'right' }
      end,
      desc = 'Toggle NeoTree and reveal current file',
    },
  },
  opts = {
    filesystem = {
      window = {
        position = 'right', -- Position NeoTree on the right side
      },
    },
  },
  config = function()
    -- Ensure NeoTree is opened automatically and on the right side when starting Neovim
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if vim.fn.argc() == 0 then
          -- Open NeoTree and reveal the current working directory
          require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd(), position = 'right' }
        else
          -- Ensure NeoTree is open with the file on the right when a file is specified
          require('neo-tree.command').execute { toggle = true, position = 'right' }
        end
      end,
    })
  end,
}
