return {
  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- { "folke/neodev.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "json",
        "lua",
        "perl",
        "python",
        "regex",
        "verilog",
        "vim",
        "yaml",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    version = false,
  },

  {
    "jayp0521/mason-nvim-dap.nvim",
    version = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    version = false,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    version = false,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },
}
