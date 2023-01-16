return {
  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  {
    "rose-pine/neovim",
    enabled = false,
    lazy = true,
    version = false,
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        dark_variant = "main",
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    version = false,
    config = function()
      require("gruvbox").setup({
        undercurl = false,
        underline = false,
      })
      vim.cmd("highlight Normal cterm=NONE ctermfg=223 ctermbg=234 guifg=#ebdbb2 guibg=#1d2021")
    end,
  },

  {
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "gruvbox",
      },
    },
  },
}
