-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    vim.api.nvim_command("!pdflatex % >/dev/null 2>&1")
    vim.api.nvim_command("redraw")
  end,
})
