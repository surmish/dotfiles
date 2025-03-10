return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ignore_install = { "diff", "yaml" },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
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

  {
    "Saghen/blink.cmp",
    build = "cargo build --release",
  },

  {
    -- "https://gitlab-master.nvidia.com/urmishs/codecompanion.nvim",
    "olimorris/codecompanion.nvim",
    keys = {
      { mode = { 'n', 'x' }, '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'toggle ai chat' },
      { mode = { 'n', 'x' }, '<leader>ai', ':CodeCompanion<cr>',                desc = 'ask chat inline' },
      { mode = { 'n', 'x' }, '<leader>am', ':CodeCompanionActions<cr>',         desc = 'CodeCompanionActions' },
      { mode = { 'v' },      '<leader>aa', '<cmd>CodeCompanionChat Add<cr>',    desc = 'CodeCompanionChat add' },
    },
    opts = {
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            -- url = "https://integrate.api.nvidia.com/v1/chat/completions",
            url = "https://llm-proxy.perflab.nvidia.com/openai/deployments/o3-mini-20250131/chat/completions?api-version=2024-12-01-preview",
            -- url = "https://llm-proxy.perflab.nvidia.com/openai/deployments/claude-3-7-sonnet-20250219/chat/completions",
            env = {
              -- api_key = "cmd:gpg --quiet --decrypt ~/.openai_api_key.asc",
              api_key = "cmd:gpg --quiet --decrypt ~/.perflab_api_key.asc",
            },
            schema = {
              model = {
                -- default = "nvdev/nvidia/llama-3.1-nemotron-70b-instruct",
                -- default = "nvdev/meta/llama-3.3-70b-instruct",
                -- default = "nvdev/deepseek-ai/deepseek-r1",
                -- default = "gpt-4o-20241120",
                -- default = "o3-mini-20250131",
                default = "claude-3-7-sonnet-20250219",
              },
            },
          })
        end,
      --   anthropic = function()
      --     return require("codecompanion.adapters").extend("anthropic", {
      --       url = "https://llm-proxy.perflab.nvidia.com/openai/deployments/claude-3-5-sonnet-20241022/chat/completions",
      --       env = {
      --         api_key = "cmd:gpg --quiet --decrypt ~/.perflab_api_key.asc",
      --       },
      --       schema = {
      --         model = {
      --           default = "claude-3-5-sonnet-20241022",
      --         },
      --       },
      --     })
      --   end,
      },
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "openai",
          slash_commands = {
            ["buffer"]  = { opts = { provider = "snacks", }, },
            ["file"]    = { opts = { provider = "snacks", }, },
            ["symbol"]  = { opts = { provider = "snacks", }, },
            ["help"]    = { opts = { provider = "snacks", }, },
          },
        },
        inline = { adapter = "openai" },
        agent = { adapter = "openai" },
      },
    },
  },

  -- {
  --   "Exafunction/codeium.nvim",
  --   event = "InsertEnter",
  --   opts = {
  --     enterprise_mode = true,
  --     api = {
  --       host = "codeium-poc.hwinf-scm-aws.nvidia.com",
  --       path = "_route/api_server",
  --       portal_url = "codeium-poc.hwinf-scm-aws.nvidia.com",
  --     },
  --   },
  -- },

  -- {
  --   "monkoose/neocodeium",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<C-j>", function() require("neocodeium").accept()              end, mode = "i", desc = "Accept suggestion" },
  --     { "<C-m>", function() require("neocodeium").accept_word()         end, mode = "i", desc = "Accept word" },
  --     { "<C-l>", function() require("neocodeium").accept_line()         end, mode = "i", desc = "Accept line" },
  --     { "<C-n>", function() require("neocodeium").cycle_or_complete()   end, mode = "i", desc = "Cycle forward" },
  --     { "<C-p>", function() require("neocodeium").cycle_or_complete(-1) end, mode = "i", desc = "Cycle backwards", },
  --     { "<C-;>", function() require("neocodeium").clear()               end, mode = "i", desc = "Clear suggestion" },
  --     { "<Leader>at", "<Cmd>NeoCodeium toggle<CR>",                          mode = "n", desc = "Toggle NeoCodeium" },
  --   },
  --   opts = {
  --     server = {
  --       api_url = 'https://codeium-poc.hwinf-scm-aws.nvidia.com/_route/api_server',
  --       portal_url = 'https://codeium-poc.hwinf-scm-aws.nvidia.com',
  --     },
  --     silent = true,
  --     completion = {
  --       autocomplete = false,
  --       menu = {
  --         auto_show = function(ctx)
  --           return ctx.mode ~= "default"
  --         end,
  --       },
  --     },
  --     filetypes = {
  --       ["NvimTree"] = false,
  --       ["codecompanion"] = false,
  --       ["snacks_picker_input"] = false,
  --     },
  --   },
  -- },

}
