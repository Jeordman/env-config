local setup, alpha = pcall(require, "alpha")
if not setup then
  return
end

-- make this also require nvim-web-devicons
-- alpha.setup(require'alpha.themes.startify'.config)
alpha.setup(require'alpha.themes.startify'.config, {
    options = {
        icons = require'nvim-web-devicons'.get_icons(),
    }
})
