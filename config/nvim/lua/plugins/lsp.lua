local is_personal = true
if os.getenv("USER") == "urmishs" then
  is_personal = false
end

return {
  {
    "neovim/nvim-lspconfig",
    -- ---@class PluginLspOpts
    opts = {
      servers = {
        bashls = {
          enabled = is_personal,
          mason = is_personal,
        },
        lua_ls = {
          enabled = is_personal,
          mason = is_personal,
        },
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
    opts = {
      defaults = {
        path_display = {
          filename_first = true,
        },
      },
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
