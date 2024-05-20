return {
  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  { "folke/noice.nvim", enabled = false },
  { "lewis6991/gitsigns.nvim", enabled = false },

  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>fe", "<cmd>Oil<CR>", desc = "Explorer" },
    },
    opts = {
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 5,
      },
    },
  },

  {
    "gen740/SmoothCursor.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      autostart = true,
      fancy = {
        enable = true,
      },
    },
  },

  { "akinsho/bufferline.nvim", enabled = false },
  {
    "romgrk/barbar.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    event = "VeryLazy",
    keys = {
      { "<A-1>", "<Cmd>BufferGoto 1<CR>", mode = { "n" }, desc = "Goto buffer 1" },
      { "<A-2>", "<Cmd>BufferGoto 2<CR>", mode = { "n" }, desc = "Goto buffer 2" },
      { "<A-3>", "<Cmd>BufferGoto 3<CR>", mode = { "n" }, desc = "Goto buffer 3" },
      { "<A-4>", "<Cmd>BufferGoto 4<CR>", mode = { "n" }, desc = "Goto buffer 4" },
      { "<A-5>", "<Cmd>BufferGoto 5<CR>", mode = { "n" }, desc = "Goto buffer 5" },
      { "<A-6>", "<Cmd>BufferGoto 6<CR>", mode = { "n" }, desc = "Goto buffer 6" },
      { "<A-p>", "<Cmd>BufferPin<CR>", mode = { "n" }, desc = "Pin buffer" },
      { "<A-s>", "<Cmd>BufferPick<CR>", mode = { "n" }, desc = "Buffer select" },
      { "<leader>bn", "<Cmd>BufferOrderByBufferNumber<CR>", mode = { "n" }, desc = "Reorder buffers by number" },
      { "<leader>bf", "<Cmd>BufferOrderByDirectory<CR>", mode = { "n" }, desc = "Reorder buffers by directory" },
      { "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", mode = { "n" }, desc = "Reorder buffers by language" },
      { "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", mode = { "n" }, desc = "Reorder buffers by window number" },
    },
  },

  { "kwkarlwang/bufresize.nvim", event = "VeryLazy" },
  { "mrjones2014/smart-splits.nvim", event = "VeryLazy" },
}
