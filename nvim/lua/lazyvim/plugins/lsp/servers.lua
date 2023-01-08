-- Add any servers here together with their settings
---@type lspconfig.options
local servers = {
  bashls = {},
  -- clangd = {},
  jsonls = {},
  pyright = {},
  yamlls = {},
  svlangserver = {},
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
}

return servers
