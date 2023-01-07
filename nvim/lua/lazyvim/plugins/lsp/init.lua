return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", config = true },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    ---@type lspconfig.options
    servers = nil,
    config = function(plugin)
      -- setup formatting and keymaps
      require("lazyvim.util").on_attach(function(client, buffer)
        require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("lazyvim.config.settings").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })

      -- lspconfig
      local servers = plugin.servers or require("lazyvim.plugins.lsp.servers")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
      require("mason-lspconfig").setup_handlers({
        function(server)
          local opts = servers[server] or {}
          opts.capabilities = capabilities
          require("lspconfig")[server].setup(opts)
        end,
      })
			require("lspconfig").clangd.setup {
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
				--   require'lspconfig'.sumneko_lua.setup {
				-- default_config = { 
				-- 	cmd = {"lua-language-server"},
				-- 	filetypes = {"lua"}, 
				--     },
				--     settings = {
				--       Lua = {
				--         runtime = {
				--           -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				--           version = 'LuaJIT',
				--         },
				--         diagnostics = {
				--           -- Get the language server to recognize the `vim` global
				--           globals = {'vim'},
				--         },
				--         workspace = {
				--           -- Make the server aware of Neovim runtime files
				--           library = vim.api.nvim_get_runtime_file("", true),
				--         },
				--         -- Do not send telemetry data containing a randomized but unique identifier
				--         telemetry = {
				--           enable = false,
				--         },
				--       },
				--     },
				--   }
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      local nls = require("null-ls")
      nls.setup({
        sources = {
          nls.builtins.diagnostics.flake8,
        },
      })
    end,
  },

  -- cmdline tools and lsp servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    ensure_installed = {
      "shellcheck",
      "shfmt",
      "flake8",
    },
    config = function(plugin)
      require("mason").setup()
      local mr = require("mason-registry")
      for _, tool in ipairs(plugin.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
}
