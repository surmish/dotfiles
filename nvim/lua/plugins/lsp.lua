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
}
