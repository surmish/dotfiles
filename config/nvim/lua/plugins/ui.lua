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

  {
    "sphamba/smear-cursor.nvim",
    enabled = true,
    lazy = false,
    opts = {
      smear_between_neighbor_lines = false,
    },
  },

}
