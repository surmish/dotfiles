-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 25
vim.opt.cursorline = false
vim.opt.clipboard = "unnamed,unnamedplus" -- sync with system clipboard
vim.opt.undolevels = 200
vim.opt.tags = os.getenv("TAGSFILE")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- disable some extension providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 1
vim.g.loaded_perl_provider = 0
