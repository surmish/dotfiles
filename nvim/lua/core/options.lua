-- [[ Setting options ]]
local opt = vim.opt
local wopt = vim.wo
local g = vim.g
-- See `:help vim.o`

-- Set highlight on search
opt.hlsearch = false

-- Make line numbers default
wopt.number = true
wopt.relativenumber = true

-- Enable mouse mode
opt.mouse = 'a'

-- yank across platforms
opt.clipboard="unnamed,unnamedplus"

opt.showmode=false

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- disable nvim intro
opt.shortmess:append "sI"

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.updatetime = 250
wopt.signcolumn = 'yes'

-- Set colorscheme
opt.termguicolors = true

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
g.mapleader = ' '
g.maplocalleader = ' '

-- Set scrolloff to non-zero value
opt.scrolloff = 18

opt.tags=os.getenv("VIM_TAG_FILE")

print 'here'
opt.laststatus = 3

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  -- "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  -- "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  -- "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  g["loaded_" .. provider .. "_provider"] = 0
end
