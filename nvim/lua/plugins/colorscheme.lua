return {
  {
    "folke/tokyonight.nvim",
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark", -- style for sidebars, see below
      floats = "dark", -- style for floating windows
    },
    lazy = true,
  },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },

  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    opts = {
      options = {
        -- colorblind = {
        --   enable = true,
        --   simulate_only = true,
        --   severity = {
        --     protan = 1,
        --     -- duetan = 1,
        --     -- tritan = 1,
        --   },
        -- },
        --   styles = {
        --     keywords = "bold",
        --     types = "bold",
        --   },
      },
      palettes = {
        -- nightfox = { green = "#00ff00" },
        -- terafox = { green = "#00ff00" },
      },
      specs = { all = { syntax = { operator = "orange" } } },
      groups = {
        all = {
          ["field"] = { fg = "palette.yellow" },
          LineNr = { fg = "palette.red" },
        },
      },
    },
  },

  -- {
  --   "rose-pine/neovim",
  --   priority = 1000,
  --   name = "rose-pine",
  --   opts = {
  --     dark_variant = "main",
  --   },
  -- },

  -- { "savq/melange-nvim" },

  -- {
  --   "uloco/bluloco.nvim",
  --   priority = 1000,
  --   dependencies = { "rktjmp/lush.nvim" },
  --   opts = {
  --     -- your optional config goes here, see below.
  --     style = "dark", -- "auto" | "dark" | "light"
  --     transparent = false,
  --     italics = false,
  --   },
  -- },

  -- {
  --   "AlexvZyl/nordic.nvim",
  --   priority = 1000,
  --   opts = {
  --     style = "flat",
  --     telescope = {
  --       style = "classic",
  --     },
  --   },
  -- },

  {
    "arturgoms/moonbow.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      undercurl = true,
    },
  },

  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   priority = 1000,
  --   opts = {
  --     filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  --   },
  -- },

  -- {
  --   "projekt0n/caret.nvim",
  --   -- lazy = true, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("caret").setup({
  --       -- ...
  --     })
  --     -- vim.cmd('colorscheme caret')
  --   end,
  -- },

  {
    "ellisonleao/gruvbox.nvim",
    -- lazy = false,
    priority = 1000,
    opts = {
      undercurl = false,
      underline = false,
    },
  },

  -- {
  --   -- github_nvim_dark
  --   "projekt0n/github-nvim-theme",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   opts = {
  --     dim_inactive = true,
  --   },
  -- },

  { "norcalli/nvim-colorizer.lua", { "norcalli/nvim-terminal.lua" } },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "moonbow",
      -- colorscheme = "caret",
      -- colorscheme = "nightfox",
      -- colorscheme = "terafox",
      -- colorscheme = "tokyonight",
      -- colorscheme = "gruvbox",
      colorscheme = "kanagawa",
      -- vim.cmd([[ set background=light ]]),
      -- vim.cmd([[ highlight Normal ctermfg=green ctermbg=yellow ]]),
    },
  },
}
