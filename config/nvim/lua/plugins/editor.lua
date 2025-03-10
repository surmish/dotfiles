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
      keys = {
        { "<leader>e", false },
        { "<leader>E", false },
      },
    },
  },

  -- lazy.nvim
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      git = { enabled = false, },
      scroll = { enabled = false, },
      lazygit = { enabled = false, },
      profiler = { enabled = false, },
      notifier = { enabled = false, },
      quickfile = { enabled = true, },
      gitbrowse = { enabled = false, },
    },
  },

  {
    "folke/flash.nvim",
    vscode = false,
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          autohide = false,
          keys = { "f", "F", "t", "T", [";"] = "h", "," },
          jump_labels = function(motion)
            -- never show jump labels by default
            -- return false
            -- Always show jump labels for ftFT
            -- return vim.v.count == 0 and motion:find("[ftFT]")
            -- Show jump labels for ftFT in operator-pending mode
            return vim.v.count == 0 and motion:find("[ftFT]") and vim.fn.mode(true):find("o")
          end,
        },
      },
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

  { "will133/vim-dirdiff", lazy = false },

}
