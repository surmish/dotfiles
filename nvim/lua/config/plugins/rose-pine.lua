local M = {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
}

function M.config()
  require("rose-pine").setup({
    --- @usage 'main' | 'moon'
    dark_variant = "main",
  })
  vim.cmd("colorscheme rose-pine")
end

return M
