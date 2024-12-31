return {

  { "imsnif/kdl.vim", ft = { 'kdl' } },
  { "folke/tokyonight.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "luisiacc/gruvbox-baby", lazy = true },

  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      specs = { all = { syntax = { operator = "orange" } } },
      groups = {
        all = {
          ["field"] = { fg = "palette.yellow" },
          LineNr = { fg = "palette.red" },
        },
      },
    },
  },

  -- issues with barbar
  -- {
  --   "f4z3r/gruvbox-material.nvim",
  --   name = "gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   opts = { contrast = "hard" },
  -- },

  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
    opts = {
      vim.cmd([[ set background=dark ]]),
      vim.cmd([[ let g:gruvbox_material_background='hard' ]]),
      vim.cmd([[ let g:gruvbox_material_transparent_background=0 ]]),
      vim.cmd([[ let g:gruvbox_material_diagnostic_line_highlight=1 ]]),
      vim.cmd([[ let g:gruvbox_material_diagnostic_virtual_text='colored' ]]),
      vim.cmd([[ let g:gruvbox_material_enable_bold=1 ]]),
      vim.cmd([[ let g:gruvbox_material_enable_italic=1 ]]),
      vim.api.nvim_set_hl(0, "NormalFloat",   { link = "Normal" }),
      vim.api.nvim_set_hl(0, "FloatBorder",   { link = "Normal" }),
      vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" }),
    },
  },

  {
    "rose-pine/neovim",
    lazy = true,
    priority = 1000,
    name = "rose-pine",
    opts = {
      dark_variant = "main",
    },
  },

  { "savq/melange-nvim",
    lazy = true,
    priority = 1000,
  },

  {
    "arturgoms/moonbow.nvim",
    lazy = false,
    priority = 1000,
  },

  { 
    "sho-87/kanagawa-paper.nvim",
    lazy = true,
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

  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      filter = "ristretto", -- classic | octagon | pro | machine | ristretto | spectrum
    },
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      undercurl = false,
      underline = false,
    },
  },

  { "norcalli/nvim-colorizer.lua", { "norcalli/nvim-terminal.lua" } },

  { "ab-dx/ares.nvim", 
    dependencies = { "rktjmp/lush.nvim" },
    lazy = true
  },

  {
    "yorumicolors/yorumi.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "moonbow",
      -- colorscheme = "caret",
      -- colorscheme = "nightfox",
      -- colorscheme = "terafox",
      -- colorscheme = "tokyonight",
      -- colorscheme = "gruvbox",
      -- colorscheme = "rose-pine",
      colorscheme = "kanagawa-wave",
      -- colorscheme = "yorumi",
      -- colorscheme = "gruvbox-material",
      -- colorscheme = "kanagawa-paper",
      -- colorscheme = "gruvbox-baby",
      -- colorscheme = "monokai-pro",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = "kanagawa-lotus",
      -- vim.cmd([[ set background=light ]]),
      -- vim.cmd([[ highlight Normal ctermfg=green ctermbg=yellow ]]),
      vim.cmd([[highlight WinSeparator guifg=#556050]]),
    },
  },
}
