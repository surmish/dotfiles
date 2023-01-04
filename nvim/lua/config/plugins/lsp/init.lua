local M = {
  "neovim/nvim-lspconfig",
  name = "lsp",
  event = "BufReadPre",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
}

function M.config()
  require("mason")
  require("config.plugins.lsp.diagnostics").setup()

  local function on_attach(client, bufnr)
    require("config.plugins.lsp.formatting").setup(client, bufnr)
    require("config.plugins.lsp.keys").setup(client, bufnr)
  end

  ---@type lspconfig.options
  local servers = {
    ansiblels = {},
    bashls = {},
    clangd = {},
    html = {},
    jsonls = {},
    pyright = {},
    rust_analyzer = {},
    yamlls = {},
    vimls = {},
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  ---@type _.lspconfig.options
  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend("force", {}, options, opts or {})
    require("lspconfig")[server].setup(opts)
  end

  require("config.plugins.null-ls").setup(options)
end

return M
