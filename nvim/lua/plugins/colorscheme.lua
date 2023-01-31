return {
  -- disable tokyonight
  { "folke/tokyonight.nvim", lazy = true },

  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", lazy = true },

  {
    "EdenEast/nightfox.nvim",
    version = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        -- options = {
        --   styles = {
        --     keywords = "bold",
        --     types = "bold",
        --   },
        --   palettes = {
        --     nightfox = { green = "#00ff00" },
        --     terafox = { green = "#00ff00" },
        --   },
        --   specs = { all = { syntax = { operator = "orange" } } },
        -- },
      })
      require("nightfox").load()
    end,
  },

  {
    "rose-pine/neovim",
    version = false,
    priority = 1000,
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        dark_variant = "main",
      })
    end,
  },

  { "savq/melange-nvim", version = false },

  {
    "uloco/bluloco.nvim",
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      -- your optional config goes here, see below.
      require("bluloco").setup({
        style = "dark", -- "auto" | "dark" | "light"
        transparent = false,
        italics = false,
      })
    end,
  },

  {
    "AlexvZyl/nordic.nvim",
    version = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        style = "flat",
        telescope = {
          style = "classic",
        },
      })
      require("nordic").load()
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    version = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        undercurl = false,
        underline = false,
      })
    end,
  },

  {
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "melange",
      },
    },
  },
}
