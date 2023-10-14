return {
  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
          cpp = "// %s",
        },
      },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "diff",
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
        "vimdoc",
        "xml",
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
        require("luasnip").filetype_extend("sh", { "shelldoc" })
        require("luasnip").filetype_extend("c", { "cdoc" })
        require("luasnip").filetype_extend("cpp", { "cppdoc" })
        require("luasnip").filetype_extend("lua", { "luadoc" })
        require("luasnip").filetype_extend("python", { "pydoc" })
        require("luasnip").filetype_extend("rust", { "rustdoc" })
        require("luasnip").filetype_extend("tcsh", { "tcl" })
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
  -- Modify nvim-cmp
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

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
    },
    opts = {
      lang = "rust",
      -- sql = "postgresql"
    },
    config = function(_, opts)
      vim.keymap.set("n", "<leader>lq", "<cmd>LcQuestionTabs<cr>")
      vim.keymap.set("n", "<leader>lm", "<cmd>LcMenu<cr>")
      vim.keymap.set("n", "<leader>lc", "<cmd>LcConsole<cr>")
      vim.keymap.set("n", "<leader>ll", "<cmd>LcLanguage<cr>")
      vim.keymap.set("n", "<leader>ld", "<cmd>LcDescriptionToggle<cr>")

      require("leetcode").setup(opts)
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
      { "<leader>mm", ":lua require('neomarks').mark_file()<CR>", desc = "Mark file" },
      { "<leader>mc", ":lua require('neomarks').menu_toggle()<CR>", desc = "Toggle the UI" },
      { "<leader>1", ":lua require('neomarks').jump_to(1)<CR>", desc = "Jump to specific index" },
      { "<leader>2", ":lua require('neomarks').jump_to(2)<CR>", desc = "Jump to specific index" },
      { "<leader>3", ":lua require('neomarks').jump_to(3)<CR>", desc = "Jump to specific index" },
      { "<leader>4", ":lua require('neomarks').jump_to(4)<CR>", desc = "Jump to specific index" },
      { "<leader>5", ":lua require('neomarks').jump_to(5)<CR>", desc = "Jump to specific index" },
    },
  },
}
