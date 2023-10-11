return {

  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    -- ---@class PluginLspOpts
    opts = {
      --   ---@type lspconfig.options
      servers = {
        svlangserver = {
          root_pattern = { ".git", ".svlangserver" },
          includeIndexing = "**/*.{sv,svh}",
          excludeIndexing = "test/**/*.sv*",
          defines = {},
          linter = "verible-verilog-lint",
          launchConfiguration = "verible-verilog-lint",
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fF", false },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
      detection_methods = { "pattern" },
    },
  },
}
