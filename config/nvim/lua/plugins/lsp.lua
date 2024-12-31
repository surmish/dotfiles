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
        perlnavigator = {
          settings = {
            perlnavigator = {
              perlPath = os.getenv("PERL_PATH"),
              includePaths = {
                os.getenv("PERL_LIB_PATH1"),
                os.getenv("PERL_LIB_PATH2"),
                os.getenv("PERL_LIB_PATH3"),
                os.getenv("PERL_LIB_PATH4"),
                os.getenv("PERL_LIB_PATH5"),
                os.getenv("PERL_LIB_PATH6"),
                os.getenv("PERL_LIB_PATH7")
              },
            },
          },
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
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
      detection_methods = { "pattern" },
    },
  },
}
