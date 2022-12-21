local M = {
  "neovim/nvim-lspconfig",
  name = "lsp",
  event = "BufReadPre",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
}

function M.config()
  require("neodev").setup({
    debug = true,
    experimental = {
      pathStrict = true,
    },
    library = {
      runtime = "~/projects/neovim/runtime/",
    },
  })
  require("config.plugins.lsp.diagnostics").setup()
  require("neoconf").setup()

  local function on_attach(client, bufnr)
    require("nvim-navic").attach(client, bufnr)
    require("config.plugins.lsp.formatting").setup(client, bufnr)
    require("config.plugins.lsp.keys").setup(client, bufnr)
  end

  ---@type lspconfig.options
  local servers = {
    bashls = {},
    clangd = {},
    html = {},
    pyright = {},
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

end

return M
