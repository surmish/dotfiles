local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "dmitmel/cmp-cmdline-history",
    "lukas-reineke/cmp-under-comparator",
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
}

function M.config()
  vim.o.completeopt = "menuone,noselect"

  -- nvim-cmp setup
  local cmp = require'cmp'
  local types = require'cmp.types'
  local luasnip = require'luasnip'

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 'c', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 'c', 's' }),
    },
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require("cmp-under-comparator").under,
        -- Same as cmp.config.compare.kind, but with the addition of preferring Variables over Text.
        function(entry1, entry2)
          local kind1 = entry1:get_kind()
          kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
          kind1 = kind1 == types.lsp.CompletionItemKind.Variable and 1 or kind1
          local kind2 = entry2:get_kind()
          kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
          kind2 = kind2 == types.lsp.CompletionItemKind.Variable and 1 or kind2
          if kind1 ~= kind2 then
            if kind1 == types.lsp.CompletionItemKind.Snippet then
              return true
            end
            if kind2 == types.lsp.CompletionItemKind.Snippet then
              return false
            end
            local diff = kind1 - kind2
            if diff < 0 then
              return true
            elseif diff > 0 then
              return false
            end
          end
        end,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
      priority_weight = 100,
    },
    sources = cmp.config.sources({
      { name = "path", priority_weight = 105 },
      { name = "cmdline", priority_weight = 105 },
      { name = "luasnip", max_item_count = 8, priority_weight = 103 },
      { name = "nvim_lsp", max_item_count = 5, priority_weight = 100 },
      { name = "nvim_lsp_signature_help", max_item_count = 5, priority_weight = 99 },
      { name = "buffer", max_item_count = 5, priority_weight = 70 },
    }),
  }
  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })
  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- `:` cmdline setup.
  cmp.setup.cmdline( ':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        { name = 'path' }
      },
      {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
  })

end

return M
