return {
  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "help",
        "html",
        "json",
        "jsonc",
        "lua",
        "luap",
        "markdown",
        "markdown_inline",
        "perl",
        "python",
        "regex",
        "verilog",
        "vim",
        "yaml",
      },
    },
  },

  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip").filetype_extend("c", { "cdoc" })
        require("luasnip").filetype_extend("cpp", { "cppdoc" })
        require("luasnip").filetype_extend("lua", { "luadoc" })
        require("luasnip").filetype_extend("python", { "pydoc" })
        require("luasnip").filetype_extend("rust", { "rustdoc" })
        require("luasnip").filetype_extend("sh", { "shelldoc" })
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
  -- Modify nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sorting.comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        function(a1, a2)
          if a1 == "Snippet" and a2 == "Variable" or a2 == "Function" then
            return true
          end
          return false
        end,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      }
      -- local types = require("cmp.types")
      -- -- Function to sort LSP snippets, so that they appear at the end of LSP suggestions
      -- local function prioritize_snippet(entry1, entry2)
      --   if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
      --     return true
      --   end
      --   if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
      --     return false
      --   end
      -- end
      -- table.insert(opts.sorting.comparators, 1, prioritize_snippet)
    end,
  },
}
