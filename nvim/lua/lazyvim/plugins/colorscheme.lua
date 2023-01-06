return {

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        dim_inactive = {
          enabled = true,
          percentage = 0.10,
        },
        integrations = {
          gitsigns = false,
        }
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
