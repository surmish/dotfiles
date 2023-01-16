return {
  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = true,
  },

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
}
