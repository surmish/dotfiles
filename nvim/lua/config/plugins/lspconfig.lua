local M = {
  "neovim/nvim-lspconfig",
  event = "InsertEnter",
  dependencies = {
    "j-hui/fidget.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
  },
}

function M.config()

  -- nvim-cmp supports additional completion capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  local lspconfig = require("lspconfig")
  lspconfig.racket_langserver.setup{}

  lspconfig.pyright.setup{
    capabilities = capabilities
  }

  lspconfig.clangd.setup {
    default_config = { 
      capabilities = capabilities; 
      cmd = { "clangd", "--background-index","--all-scopes-completion", "--pch-storage=memory", "--clang-tidy", "--suggest-missing-includes", "--cross-file-rename" }, 
      filetypes = {"c", "cpp"}, 
      init_options = { 
        clangdFileStatus     = true,
        usePlaceholders      = true,
        completeUnimported   = true,
        semanticHighlighting = false
      }, 
      root_dir = require'lspconfig'.util.root_pattern("compile_flags.txt") 
      -- root_dir = require'lspconfig'.util.root_pattern("compile_flags.txt","apbld","compile_commands.json") 
    }, 
    on_attach = on_attach_common 
  }

  lspconfig.rust_analyzer.setup({
    on_attach=on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true
        },
        procMacro = {
          enable = true
        },
      }
    }
  })

end

return M
