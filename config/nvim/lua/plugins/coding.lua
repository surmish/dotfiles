return {

  { "windwp/nvim-ts-autotag", enabled = false, },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "fish",
        "diff",
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
        "vimdoc",
        "xml",
        "yaml",
      },
    },
  },

  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },

  -- {
  --   "L3MON4D3/LuaSnip",
  --   dependencies = {
  --     "rafamadriz/friendly-snippets",
  --     config = function()
  --       require("luasnip").filetype_extend("sh", { "shelldoc" })
  --       require("luasnip").filetype_extend("c", { "cdoc" })
  --       require("luasnip").filetype_extend("cpp", { "cppdoc" })
  --       require("luasnip").filetype_extend("lua", { "luadoc" })
  --       require("luasnip").filetype_extend("python", { "pydoc" })
  --       require("luasnip").filetype_extend("rust", { "rustdoc" })
  --       require("luasnip").filetype_extend("tcsh", { "tcl" })
  --       -- for LuaSnip snippets
  --       require("luasnip.loaders.from_vscode").lazy_load()
  --       -- for custom snippets in .config/nvim/snippets dir
  --       require("luasnip.loaders.from_vscode").lazy_load({
  --         paths = { vim.fn.stdpath("config") .. "/snippets" },
  --       })
  --     end,
  --   },
  -- },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
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

  -- {
  --   "ThePrimeagen/harpoon",
  --   -- event = "VeryLazy",
  --   dependencies = "nvim-lua/plenary.nvim",
  --   opts = {
  --     global_settings = {
  --       mark_branch = false,
  --     },
  --   },
  --   keys = {
  --     { "<leader>mm", ":lua require('harpoon.mark').add_file()<CR>", desc = "Add Harpoon mark" },
  --     { "<leader>mc", ":lua require('harpoon.mark').add_file()<CR>", desc = "Clear all Harpoon marks" },
  --     { "<leader>ml", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon toggle quick menu" },
  --     { "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon file 1" },
  --     { "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon file 2" },
  --     { "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon file 3" },
  --     { "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon file 4" },
  --     { "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>", desc = "Harpoon file 5" },
  --     -- {
  --     --   "<space>md",
  --     --   function()
  --     --     local index = require("harpoon.mark").get_index_of(vim.fn.bufname())
  --     --     require("mini.bufremove").delete(0, true)
  --     --     require("harpoon.mark").rm_file(index)
  --     --   end,
  --     --   desc = "Delete buffer and remove Harpoon mark",
  --     -- },
  --   },
  -- },

  {
    "saccarosium/neomarks",
    -- event = "VeryLazy",
    opts = {
      storagefile = vim.fn.stdpath("data") .. "/neomarks.json",
      menu = {
        title = "Neomarks",
        title_pos = "center",
        border = "rounded",
        width = 60,
        height = 10,
      },
    },
    keys = {
      { "<leader>mm", ":lua require('neomarks').mark_file()<CR>", desc = "Neomark mark file" },
      { "<leader>mc", ":lua require('neomarks').menu_toggle()<CR>", desc = "Neomark UI" },
      { "<leader>1", ":lua require('neomarks').jump_to(1)<CR>", desc = "Neomark index 1" },
      { "<leader>2", ":lua require('neomarks').jump_to(2)<CR>", desc = "Neomark index 2" },
      { "<leader>3", ":lua require('neomarks').jump_to(3)<CR>", desc = "Neomark index 3" },
      { "<leader>4", ":lua require('neomarks').jump_to(4)<CR>", desc = "Neomark index 4" },
      { "<leader>5", ":lua require('neomarks').jump_to(5)<CR>", desc = "Neomark index 5" },
      { "<leader>6", ":lua require('neomarks').jump_to(6)<CR>", desc = "Neomark index 6" },
      { "<leader>7", ":lua require('neomarks').jump_to(7)<CR>", desc = "Neomark index 7" },
      { "<leader>8", ":lua require('neomarks').jump_to(8)<CR>", desc = "Neomark index 8" },
      { "<leader>9", ":lua require('neomarks').jump_to(9)<CR>", desc = "Neomark index 9" },
    },
  },

  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- optional
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
    keys = {
      { "<leader>es", ":lua require('scissors').editSnippet()<CR>", mode = { "n" }, desc = "Edit Snippet" },
      { "<leader>as", ":lua require('scissors').addNewSnippet()<CR>", mode = { "n", "x" }, desc = "Add New Snippet" },
    },
    telescope = {
      alsoSearchSnippetBody = true,
    },
    jsonFormatter = "jq",
  },
}
