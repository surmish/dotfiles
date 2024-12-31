return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "diff",
        "fish",
        "html",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "perl",
        "python",
        "regex",
        "tcl",
        "verilog",
        "vim",
        "vimdoc",
        "xml"
      },
    },
  },

  { "pedrohdz/vim-yaml-folds", ft = { "yaml" }, },
  { "mechatroner/rainbow_csv", ft = { "csv" }, },

  { "junegunn/fzf", build = "./install --all" },
  -- { "wellle/context.vim", lazy = false },

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
    },
  },

  {
    "chrisgrieser/nvim-scissors",
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
    keys = {
      { "<leader>es", ":lua require('scissors').editSnippet()<CR>", mode = { "n" }, desc = "Edit Snippet" },
      { "<leader>as", ":lua require('scissors').addNewSnippet()<CR>", mode = { "n", "x" }, desc = "Add New Snippet" },
    },
    jsonFormatter = "jq",
  },
}
