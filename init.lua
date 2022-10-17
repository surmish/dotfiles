local g = vim.g
local cmd = vim.cmd

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}

cmd[[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
]]

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

for i = 1, 10 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end

require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  use {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  use 'lewis6991/impatient.nvim'
  require('impatient')

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/nvim-treesitter-endwise'

  -- Load only when require
  use { "nvim-lua/plenary.nvim", module = "plenary" }

  -- Better icons
  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  }

  use 'David-Kunz/markid'

  use { 
    'folke/zen-mode.nvim', 
    opt = true, 
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 0.75, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
          -- height and width can be:
          -- * an absolute number of cells when > 1
          -- * a percentage of the width / height of the editor when <= 1
          width = 0.8, -- width of the Zen window
          height = 0.8, -- height of the Zen window
          -- by default, no options are changed for the Zen window
          -- uncomment any of the options below, or add other vim.wo options you want to apply
          options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
          },
        },
        plugins = { 
          tmux = { enabled = true },
        }
      }
    end,
  }

  use {
    "hoschi/yode-nvim",
    opt = true,
    cmd = { "YodeCreateSeditorFloating", "YodeFloatToMainWindow", "YodeCloneCurrentIntoFloat" },
    config = function()
      require("yode-nvim").setup {}
    end,
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }

  use { 
    'sakhnik/nvim-gdb',
    cmd = { "GdbStart", "GdbStartLLDB" },
    opt = true,
  }

  use { 'kyazdani42/nvim-tree.lua' , requires = {'kyazdani42/nvim-web-devicons'} }
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_cursor = true,
    open_on_setup = true,
    view = {
      width = 50,
    },
  }

  -- colors/tabs formatting
  use { "ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"} }
  use { 'luisiacc/gruvbox-baby' }
  local colors = require("gruvbox-baby.colors").config()
  vim.g.gruvbox_baby_highlights = {
    Visual = {bg = colors.medium_gray},
    Normal = {fg = colors.milk, bg = colors.dark},
  }
  use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- use { 
  --   'nvim-telescope/telescope-file-browser.nvim',
  --   requires = {
  --     {'nvim-lua/plenary.nvim'}
  --   },
  -- }
  -- telescope
	use {
		'nvim-telescope/telescope.nvim', 
		opt = true,
		cmd = "Telescope",
		requires = {
			{'nvim-lua/popup.nvim'}, 
			{'nvim-lua/plenary.nvim'}
		},
	}

  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip' -- snippet-engine
  use 'hrsh7th/nvim-cmp' -- A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  -- use 'kkonghao/snippet-dog'
  use 'neovim/nvim-lspconfig' -- Extensions to built-in LSP, for example, providing type inlay hints
  use 'saadparwaiz1/cmp_luasnip' -- luasnip completion source for nvim-cmp
  use 'rafamadriz/friendly-snippets'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'lukas-reineke/cmp-under-comparator'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  use 'surmish/lua-style-snippets'

  use { 
    'simrat39/rust-tools.nvim' , 
    opt = true, 
    ft = {
      "rust",
    },
    config = function ()
      require('rust-tools').setup {
        tools = { 
          -- rust-tools options
          -- automatically set inlay hints (type hints)
          -- There is an issue due to which the hints are not applied on the first
          -- opened file. For now, write to the file to trigger a reapplication of
          -- the hints or just run :RustSetInlayHints.
          -- default: true
          autoSetHints = true,
          -- whether to show hover actions inside the hover window
          -- this overrides the default hover handler
          -- default: true
          hover_with_actions = true,
          runnables = {
            -- whether to use telescope for selection menu or not
            -- default: true
            use_telescope = true
            -- rest of the opts are forwarded to telescope
          },
          inlay_hints = {
            -- wheter to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,
            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<-",
            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix  = "=>",
            -- whether to align to the lenght of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
          },
          hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
              {"╭", "FloatBorder"},
              {"─", "FloatBorder"},
              {"╮", "FloatBorder"},
              {"│", "FloatBorder"},
              {"╯", "FloatBorder"},
              {"─", "FloatBorder"},
              {"╰", "FloatBorder"},
              {"│", "FloatBorder"}
            },
          },
        },
        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
        server = {}, -- rust-analyzer options
      }
    end,
  }

  use {'kevinhwang91/nvim-bqf', ft = 'qf'}

  use 'ggandor/leap.nvim'

  -- use({
  --   "aserowy/tmux.nvim",
  --   config = function()
  --     require("tmux").setup({
  --       -- overwrite default configuration
  --       -- here, e.g. to enable default bindings
  --       navigation = {
  --         -- enables default keybindings (C-hjkl) for normal mode
  --         enable_default_keybindings = false,
  --       },
  --       resize = {
  --         -- enables default keybindings (A-hjkl) for normal mode
  --         enable_default_keybindings = false,
  --       }
  --     })
  --   end
  -- })

end)

vim.o.completeopt= "menu,menuone,noselect"

-- Setup nvim-cmp.
local cmp = require'cmp'
local types = require'cmp.types'
local luasnip_ok, luasnip = pcall(require, 'luasnip')
cmp.setup({
	snippet = {
		expand = function(args)
			if luasnip_ok then
				luasnip.lsp_expand(args.body)
			else
				return
			end
		end,
	},
	window = {
		completion = {
			border = 'rounded',
			winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
		},
		documentation = {
			border = 'rounded',
			winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
		},
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-j>'] = cmp.mapping.confirm({ select = true }),
		['<C-n>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		['<C-p>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
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
  },{
    { name = "buffer", max_item_count = 5, priority_weight = 70 },
    }),
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
  { name = 'buffer' }
  }
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
  { name = 'path' }
  }, {
    { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client)
  require'completion'.on_attach(client)
  require('vim.lsp.protocol').CompletionItemKind = {
    '';   -- Text          = 1;
    '';   -- Method        = 2;
    'ƒ';   -- Function      = 3;
    '';   -- Constructor   = 4;
    '識';  -- Field         = 5;
    '';   -- Variable      = 6;
    '';   -- Class         = 7;
    'ﰮ';   -- Interface     = 8;
    '';   -- Module        = 9;
    '';   -- Property      = 10;
    '';   -- Unit          = 11;
    '';   -- Value         = 12;
    '了';  -- Enum          = 13;
    '';   -- Keyword       = 14;
    '﬌';   -- Snippet       = 15;
    '';   -- Color         = 16;
    '';   -- File          = 17;
    '渚';  -- Reference     = 18;
    '';   -- Folder        = 19;
    '';   -- EnumMember    = 20;
    '';   -- Constant      = 21;
    '';   -- Struct        = 22;
    '鬒';  -- Event         = 23;
    'Ψ';   -- Operator      = 24;
    '';   -- TypeParameter = 25;
  }
end

require'lspconfig'.racket_langserver.setup{}

require'lspconfig'.pyright.setup{
  capabilities = capabilities
}

require'lspconfig'.clangd.setup {
  default_config = { 
    capabilities = capabilities; 
    cmd = { "clangd", "--background-index","--all-scopes-completion", "--pch-storage=memory", "--clang-tidy", "--suggest-missing-includes", "--cross-file-rename" }, 
    filetypes = {"c", "cpp"}, 
    init_options = { 
      clangdFileStatus     = true,
      usePlaceholders      = true,
      completeUnimported   = true,
      semanticHighlighting = false
    }, 
    root_dir = require'lspconfig'.util.root_pattern("compile_flags.txt") 
    -- root_dir = require'lspconfig'.util.root_pattern("compile_flags.txt","apbld","compile_commands.json") 
  }, 
  on_attach = on_attach_common 
}

require'lspconfig'.rust_analyzer.setup({
  on_attach=on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  }
})

require('lualine').setup {
  options = {
    globalstatus = true,
    -- theme = 'gruvbox-flat'
    -- theme = 'gruvbox'
    -- theme = 'everforest'
    -- theme = 'dracula'
    theme = 'gruvbox-baby'
  },
}

local ls      = require "luasnip"
local lstypes = require "luasnip.util.types"
require'luasnip'.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [lstypes.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

require("luasnip.loaders.from_vscode").lazy_load()

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c","cpp","rust","python","lua","commonlisp","verilog","bash","json","vim"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable  = true, -- false will disable the whole extension
    disable = {},   -- list of language that will be disabled
  },
  markid = {
    enable = false,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  -- playground = {
  -- 	enable = true,
  -- 	disable = {},
  -- 	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
  -- 	persist_queries = false, -- Whether the query persists across vim sessions
  -- 	keybindings = {
  -- 		toggle_query_editor = 'o',
  -- 		toggle_hl_groups = 'i',
  -- 		toggle_injected_languages = 't',
  -- 		toggle_anonymous_nodes = 'a',
  -- 		toggle_language_display = 'I',
  -- 		focus_language = 'f',
  -- 		unfocus_language = 'F',
  -- 		update = 'R',
  -- 		goto_node = '<cr>',
  -- 		show_help = '?',
  -- 	},
  -- },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  refactor = {
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
  endwise = {
    enable = true,
  },
}

require('bufferline').setup {
  options = {
    numbers = "buffer_id" ,
    -- number_style = { "none", "superscript" }, -- buffer_id at index 1, ordinal at index 2
    -- mappings = true ,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    --   close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    --   right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    --   left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    --   middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    --   -- NOTE: this plugin is designed with this icon in mind,
    --   -- and so changing this is NOT recommended, this is intended
    --   -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = {
      style = 'icon',
      icon = '|',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --   --- name_formatter can be used to change the buffer's label in the bufferline.
    --   --- Please note some names can/will break the
    --   --- bufferline so use this at your discretion knowing that it has
    --   --- some limitations that will *NOT* be fixed.
    --   name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
    --     -- remove extension from markdown files for example
    --     if buf.name:match('%.md') then
    --       return vim.fn.fnamemodify(buf.name, ':t:r')
    --     end
    --   end,
    --   max_name_length = 18,
    --   max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    --   tab_size = 18,
    diagnostics = false,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "("..count..")"
    -- end,
    --   -- NOTE: this will be called a lot so don't do any heavy processing here
    --   custom_filter = function(buf_number)
    --     -- filter out filetypes you don't want to see
    --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --       return true
    --     end
    --     -- filter out by buffer name
    --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --       return true
    --     end
    --     -- filter out based on arbitrary rules
    --     -- e.g. filter out vim wiki buffer from tabline in your work repo
    --     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --       return true
    --     end
    --   end,
    --   offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left" | "center" | "right"}},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    --   persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    --   -- can also be a table containing 2 custom separators
    --   -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "slant",
    --   enforce_regular_tabs = false | true,
    --   always_show_bufferline = true | false,
    --   sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
    --     -- add custom logic
    --     return buffer_a.modified > buffer_b.modified
    --   end
  }
}

require('leap').set_default_keymaps()

cmd [[
nnoremap <F7> :NvimTreeToggle<CR>
set laststatus=3
set splitkeep=cursor
highlight WinSeperator guibg=None
set clipboard+=unnamedplus
" let g:gruvbox_italic_keywords   = 0
" let g:gruvbox_italic_comments   = 0
" let g:gruvbox_italic_functions  = 0
" let g:gruvbox_italic_variables  = 0
set termguicolors
snoremap <silent> <Tab>   <cmd>lua require'luasnip'.jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
" nnoremap <leader>fb :Telescope file_browser<Cr>

" Yoda setup
map  <Leader>yc :YodeCreateSeditorFloating<CR>
nmap <Leader>bd :YodeBufferDelete<cr>
" at the moment this is needed to have no gap for floating windows
set showtabline=2

if has("autocmd")
  " gq is the format key.
  autocmd FileType c,cpp setlocal formatprg=clang-format\ -style=file:$HOME/.clang-format
  autocmd FileType rust  setlocal formatprg=rustfmt\ --emit=stdout
endif
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END

set background = "dark"
" colorscheme gruvbox
" colorscheme kanagawa
colorscheme gruvbox-baby
]]
