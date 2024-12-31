-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.tags         = os.getenv("TAGSFILE")
vim.opt.clipboard    = "unnamedplus"
vim.opt.undolevels   = 200
vim.opt.signcolumn   = "no"
vim.g.snacks_animate = false

vim.g.loaded_node_provider = 1
vim.g.loaded_perl_provider = 1
vim.g.loaded_ruby_provider = 1
