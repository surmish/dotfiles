-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  { "nfvs/vim-perforce", lazy = false },

  {
    "folke/todo-comments.nvim",
    enabled = false,
  },

  -- customize file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      filesystem = {
        -- time the current file is changed while the tree is open.
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      },
    },
  },

  -- change trouble config
  -- {
  --   "folke/trouble.nvim",
  --   opts = { use_diagnostic_signs = true },
  -- },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- add zen-mode
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1,
        height = 0.9,
        -- width = 140,
        options = {
          number = false,
          relativenumber = false,
          signcolumn = "no",
          list = false,
          cursorline = false,
        },
      },
    },
    keys = {
      {
        "<leader>Z",
        function()
          require("zen-mode").toggle()
          vim.cmd([[ set nonumber norelativenumber ]])
        end,
        desc = "Zen Mode",
      },
    },
    config = function()
      require("twilight").setup({
        context = 10,
        treesitter = true,
      })
    end,
  },

  {
    "folke/twilight.nvim",
    opts = {
      context = -1,
      treesitter = true,
    },
  },

  {
    "willothy/flatten.nvim",
    config = true,
    -- or pass configuration with
    -- opts = {  }
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },

  { "ggandor/leap.nvim", enabled = false },
  { "ggandor/flit.nvim", enabled = false },

  { "will133/vim-dirdiff", lazy = false },
}
