return {
  { "folke/noice.nvim", enabled = false },
  { "lewis6991/gitsigns.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>fe", "<cmd>Oil<CR>", desc = "File Explorer" },
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
  },

  { "rcarriga/nvim-notify", enabled = false, },
  { "kwkarlwang/bufresize.nvim", event = "VeryLazy" },
  { "mrjones2014/smart-splits.nvim", event = "VeryLazy" },
}
