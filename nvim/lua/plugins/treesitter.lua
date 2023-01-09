return {

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "json",
        "lua",
        "python",
        "regex",
        "verilog",
        "vim",
        "yaml",
      },
    },
  },
}
