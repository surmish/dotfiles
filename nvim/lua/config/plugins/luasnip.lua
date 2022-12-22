local M = {
  "L3MON4D3/LuaSnip",

  dependencies = {
    "surmish/lua-style-snippets",
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("fidget").setup()
    end,
  },
}

function M.config()

  local lstypes = require"luasnip.util.types"
  local luasnip = require"luasnip"

  luasnip.config.setup {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = true,
    -- Autosnippets:
    enable_autosnippets = true,
    -- Update more often, :h events for more info.
    -- This one is cool cause if you have dynamic snippets, it updates as you type!
    updateevents = "TextChanged,TextChangedI",
    ext_opts = {
      [lstypes.choiceNode] = {
        active = {
          virt_text = { { "<-", "Error" } },
        },
      },
    },
  }

end

return M
