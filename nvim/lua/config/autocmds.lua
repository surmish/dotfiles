-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Autoformat setting
local set_autoformat = function(pattern, bool_val)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = pattern,
    callback = function()
      vim.b.autoformat = bool_val
    end,
  })
end

set_autoformat({ "cpp" }, true)
set_autoformat({ "fish" }, false)

-- File type setting
local set_filetype = function(pattern, filetype)
  vim.api.nvim_create_autocmd({ "VimEnter", "BufRead", "BufNewFile", "BufEnter" }, {
    pattern = pattern,
    callback = function()
      vim.api.nvim_set_option_value("filetype", filetype, { scope = "local" })
    end,
  })
end

set_filetype({ "*.mk", "Make*" }, "make")
set_filetype({ "buildmap.config", "tool_data.config" }, "confini")
set_filetype({ "ip*.config", "*rtl.config", "*ip.config" }, "yaml")
-- tcl as tcsh just for the colors
set_filetype({ "*.tcl", "*.tn" }, "tcsh")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    vim.api.nvim_command("!pdflatex % >/dev/null 2>&1")
    vim.api.nvim_command("redraw")
  end,
})

local group = vim.api.nvim_create_augroup("DiffModeColors", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  pattern = { "*", "diff" },
  command = "if &diff | colorscheme moonbow | endif",
})
