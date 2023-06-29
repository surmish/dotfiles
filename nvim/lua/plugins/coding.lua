return {
  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- { "folke/neodev.nvim", enabled = false },
  -- { "folke/trouble.nvim", enabled = false },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "help",
        "html",
        "json",
        "jsonc",
        "lua",
        "luap",
        "markdown",
        "markdown_inline",
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
