return {
  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },
  { "akinsho/bufferline.nvim", enabled = false },

  -- floating winbar
  {
    "b0o/incline.nvim",
    version = false,
    priority = 1000,
    event = "BufReadPre",
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  { "lewis6991/gitsigns.nvim", enabled = false },

  {
    "gen740/SmoothCursor.nvim",
    priority = 1000,
    version = false,
    lazy = false,
    config = function()
      require("smoothcursor").setup({
        autostart = true,
        fancy = {
          enable = true, -- enable fancy mode
        },
      })
    end,
  },

  {
    "romgrk/barbar.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    enabled = true,
    event = "VeryLazy",
    opts = {
      -- Enables/disable clickable tabs
      --  - left-click: go to buffer
      --  - middle-click: delete buffer
      clickable = true,

      -- Excludes buffers from the tabline
      -- exclude_ft = { "javascript" },

      -- exclude_name = { "package.json" },

      sidebar_filetypes = {
        -- ["neo-tree"] = { event = "BufWipeout", text = "neo-tree" },
      },

      icons = {
        -- Configure the base icons on the bufferline.
        buffer_index = false,
        buffer_number = false,
        button = "",
        -- Enables / disables diagnostic symbols
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = false, icons = " " },
          [vim.diagnostic.severity.WARN] = { enabled = false },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = false },
        },
        filetype = {
          -- Sets the icon's highlight group.
          -- If false, will use nvim-web-devicons colors
          custom_colors = false,

          -- Requires `nvim-web-devicons` if `true`
          enabled = true,
        },

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = { button = "●" },
        pinned = { button = "車", filename = true, separator = { right = "" } },
      },
    },
    config = function(_, opts)
      require("barbar").setup(opts)
      -- local hl = require("bufferline.utils").hl
      -- local fg_current = hl.fg_or_default({ "Normal" }, "#ff00ff", 255)
      -- local bg_current = hl.bg_or_default({ "Normal" }, "none")
      -- hl.set("BufferDefaultCurrent", bg_current, fg_current)
    end,
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, _)
      local dashboard = require("alpha.themes.dashboard")
      local logo = "NVIM (minimal)"

      dashboard.section.header.val = vim.split(logo, "\n")

      dashboard.section.buttons.val = {
        { type = "padding", val = 1 },
        dashboard.button("n", " " .. " new file", ":ene <bar> startinsert <cr>"),
        dashboard.button("r", " " .. " recent files", ":Telescope oldfiles <cr>"),
        dashboard.button("s", " " .. " load session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("f", " " .. " find file", ":Telescope find_files <cr>"),
        dashboard.button("o", " " .. " smart open", ":Telescope smart_open <cr>"),
        dashboard.button("g", " " .. " grep text", ":Telescope live_grep <cr>"),
        dashboard.button("c", " " .. " config", ":e $MYVIMRC <cr>"),
        dashboard.button("z", "鈴" .. " lazy", ":Lazy<cr>"),
        dashboard.button("t", " " .. " terminal", ":lua require('lazyvim.util').float_term()<cr>"),
        dashboard.button("q", " " .. " quit", ":qa<cr>"),
        { type = "padding", val = 1 },
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        if button.opts ~= nil then
          button.opts.hl = "AlphaButtons"
          button.opts.hl_shortcut = "AlphaShortcut"
        end
      end

      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8

      return dashboard
    end,
  },
}
