vim.cmd[[
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

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'p00f/nvim-ts-rainbow'
  use 'folke/zen-mode.nvim'
  use 'folke/tokyonight.nvim'
  use 'kkonghao/snippet-dog'
  use 'sakhnik/nvim-gdb'
  use 'karb94/neoscroll.nvim'
  use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use {'ms-jpq/chadtree', run = function()
    vim.fn.system("python3 -m chadtree deps")
    vim.cmd("CHADdeps")
  end}
  use 'eddyekofo94/gruvbox-flat.nvim'
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  use 'L3MON4D3/LuaSnip' -- snippet-engine
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/nvim-compe' -- Collection of common configurations for the Nvim LSP client
  use 'neovim/nvim-lspconfig' -- Extensions to built-in LSP, for example, providing type inlay hints
  use 'nvim-lua/lsp_extensions.nvim'
  use 'simrat39/rust-tools.nvim'
  use({
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        -- overwrite default configuration
        -- here, e.g. to enable default bindings
        navigation = {
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = false,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = false,
        }
      })
    end
  })
end)

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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup {
  default_config = { 
    capabilities = capabilities; 
    cmd = { "clangd", "--background-index","--all-scopes-completion", "--pch-storage=memory", "--clang-tidy", "--suggest-missing-includes", "--cross-file-rename" }, 
    filetypes = {"c", "cpp", "objc", "objcpp"}, 
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
    -- theme = 'gruvbox-flat'
    theme = 'gruvbox'
    -- theme = 'everforest'
    -- theme = 'dracula'
  }
}

vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- vsnip = true;
    -- ultisnips = true;
    luasnip = true;
    treesitter = true;
  };
}

require("luasnip").config.set_config { updateevents = "TextChanged,TextChangedI" }
require("luasnip/loaders/from_vscode").lazy_load()

require("zen-mode").setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
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

require'nvim-treesitter.configs'.setup {
	ensure_installed = {"c","cpp","rust","python","lua","commonlisp","verilog","bash","json"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	-- ignore_install = { "javascript" }, -- List of parsers to ignore installing
	highlight = {
		enable  = true, -- false will disable the whole extension
		disable = {},   -- list of language that will be disabled
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
				-- Or you can define your own textobjects like this
				["iF"] = {
					python = "(function_definition) @function",
					cpp = "(function_definition) @function",
					c = "(function_definition) @function",
					java = "(method_declaration) @function",
				},
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
}

require('neoscroll').setup()

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
    indicator_icon = '▎',
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

vim.cmd [[
nnoremap <F7> :CHADopen<CR>
set clipboard+=unnamedplus
let g:gruvbox_italic_keywords   = 0
let g:gruvbox_italic_comments   = 0
let g:gruvbox_italic_functions  = 0
let g:gruvbox_italic_variables  = 0
let g:gruvbox_flat_style = "hard"
let g:chadtree_settings = { "theme.text_colour_set": "nerdtree_syntax_dark" }
colorscheme gruvbox-flat
inoremap <silent><expr> <C-k> compe#complete()
inoremap <silent><expr> <C-j> compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })
imap <silent><expr> <Tab>   luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev': '<S-Tab>'
snoremap <silent> <Tab>   <cmd>lua require'luasnip'.jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
]]
