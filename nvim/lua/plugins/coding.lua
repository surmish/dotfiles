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
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
}
