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
    "kwkarlwang/bufresize.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
      local opts = { noremap = true, silent = true }
      require("bufresize").setup({
        register = {
          keys = {
            { "n", "<leader>w<", "30<C-w><", opts },
            { "n", "<leader>w>", "30<C-w>>", opts },
            { "n", "<leader>w+", "10<C-w>+", opts },
            { "n", "<leader>w-", "10<C-w>-", opts },
            { "n", "<leader>w_", "<C-w>_", opts },
            { "n", "<leader>w=", "<C-w>=", opts },
            { "n", "<leader>w|", "<C-w>|", opts },
            { "n", "<leader>wo", "<C-w>|<C-w>_", opts },
          },
          trigger_events = { "BufWinEnter", "WinEnter" },
        },
        resize = {
          keys = {},
          trigger_events = { "VimResized" },
          increment = 5,
        },
      })
    end,
  },

  {
    "mrjones2014/smart-splits.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
      require("smart-splits").setup({
        -- Ignored filetypes (only while resizing)
        ignored_filetypes = {
          "nofile",
          "quickfix",
          "prompt",
        },
        -- Ignored buffer types (only while resizing)
        ignored_buftypes = { "NvimTree" },
        -- the default number of lines/columns to resize by at a time
        default_amount = 3,
        -- Desired behavior when your cursor is at an edge and you
        -- are moving towards that same edge:
        -- 'wrap' => Wrap to opposite side
        -- 'split' => Create a new split in the desired direction
        -- 'stop' => Do nothing
        -- function => You handle the behavior yourself
        -- NOTE: If using a function, the function will be called with
        -- a context object with the following fields:
        -- {
        --    mux = {
        --      type:'tmux'|'wezterm'|'kitty'
        --      current_pane_id():number,
        --      is_in_session(): boolean
        --      current_pane_is_zoomed():boolean,
        --      -- following methods return a boolean to indicate success or failure
        --      current_pane_at_edge(direction:'left'|'right'|'up'|'down'):boolean
        --      next_pane(direction:'left'|'right'|'up'|'down'):boolean
        --      resize_pane(direction:'left'|'right'|'up'|'down'):boolean
        --      split_pane(direction:'left'|'right'|'up'|'down',size:number|nil):boolean
        --    },
        --    direction = 'left'|'right'|'up'|'down',
        --    split(), -- utility function to split current Neovim pane in the current direction
        --    wrap(), -- utility function to wrap to opposite Neovim pane
        -- }
        -- NOTE: `at_edge = 'wrap'` is not supported on Kitty terminal
        -- multiplexer, as there is no way to determine layout via the CLI
        at_edge = "wrap",
        -- when moving cursor between splits left or right,
        -- place the cursor on the same row of the *screen*
        -- regardless of line numbers. False by default.
        -- Can be overridden via function parameter, see Usage.
        move_cursor_same_row = false,
        -- whether the cursor should follow the buffer when swapping
        -- buffers by default; it can also be controlled by passing
        -- `{ move_cursor = true }` or `{ move_cursor = false }`
        -- when calling the Lua function.
        cursor_follows_swapped_bufs = false,
        -- resize mode options
        resize_mode = {
          -- key to exit persistent resize mode
          quit_key = "<ESC>",
          -- keys to use for moving in resize mode
          -- in order of left, down, up' right
          resize_keys = { "h", "j", "k", "l" },
          -- set to true to silence the notifications
          -- when entering/exiting persistent resize mode
          silent = false,
          -- must be functions, they will be executed when
          -- entering or exiting the resize mode
          hooks = {
            on_enter = nil,
            on_leave = nil,
          },
        },
        -- ignore these autocmd events (via :h eventignore) while processing
        -- smart-splits.nvim computations, which involve visiting different
        -- buffers and windows. These events will be ignored during processing,
        -- and un-ignored on completed. This only applies to resize events,
        -- not cursor movement events.
        ignored_events = {
          "BufEnter",
          "WinEnter",
        },
        -- enable or disable a multiplexer integration;
        -- automatically determined, unless explicitly disabled or set,
        -- by checking the $TERM_PROGRAM environment variable,
        -- and the $KITTY_LISTEN_ON environment variable for Kitty
        multiplexer_integration = nil,
        -- disable multiplexer navigation if current multiplexer pane is zoomed
        -- this functionality is only supported on tmux and Wezterm due to kitty
        -- not having a way to check if a pane is zoomed
        disable_multiplexer_nav_when_zoomed = true,
        -- Supply a Kitty remote control password if needed,
        -- or you can also set vim.g.smart_splits_kitty_password
        -- see https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.remote_control_password
        kitty_password = nil,
        -- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
        log_level = "info",
      })
    end,
  },

  -- {
  --   "goolord/alpha-nvim",
  --   opts = function(_, _)
  --     local dashboard = require("alpha.themes.dashboard")
  --     local logo = "NVIM (minimal)"
  --     dashboard.section.header.val = vim.split(logo, "\n")
  --     dashboard.section.buttons.val = {
  --       { type = "padding", val = 1 },
  --       dashboard.button("n", " " .. " new file", ":ene <bar> startinsert <cr>"),
  --       dashboard.button("r", " " .. " recent files", ":Telescope oldfiles <cr>"),
  --       dashboard.button("s", " " .. " load session", [[:lua require("persistence").load() <cr>]]),
  --       dashboard.button("f", " " .. " find file", ":Telescope find_files <cr>"),
  --       dashboard.button("o", " " .. " smart open", ":Telescope smart_open <cr>"),
  --       dashboard.button("g", " " .. " grep text", ":Telescope live_grep <cr>"),
  --       dashboard.button("c", " " .. " config", ":e $MYVIMRC <cr>"),
  --       dashboard.button("z", "鈴" .. " lazy", ":Lazy<cr>"),
  --       dashboard.button("t", " " .. " terminal", ":lua require('lazyvim.util').float_term()<cr>"),
  --       dashboard.button("q", " " .. " quit", ":qa<cr>"),
  --       { type = "padding", val = 1 },
  --     }
  --     for _, button in ipairs(dashboard.section.buttons.val) do
  --       if button.opts ~= nil then
  --         button.opts.hl = "AlphaButtons"
  --         button.opts.hl_shortcut = "AlphaShortcut"
  --       end
  --     end
  --     dashboard.section.footer.opts.hl = "AlphaFooter"
  --     dashboard.section.header.opts.hl = "AlphaHeader"
  --     dashboard.section.buttons.opts.hl = "AlphaButtons"
  --     dashboard.opts.layout[1].val = 8
  --     return dashboard
  --   end,
  -- },
}
