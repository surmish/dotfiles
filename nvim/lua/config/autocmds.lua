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

function OpenPerforceFileWithRevision(depotPath)
  -- Strip the revision number from the depot path, if present
  local strippedPath = string.gsub(depotPath, "#%d+$", "")

  -- Run 'p4 where' command for the stripped path
  local handle, err = io.popen("p4 where " .. strippedPath, "r")

  if not handle then
    print("Failed to execute 'p4 where': " .. err)
    return
  end

  local result = handle:read("*a")
  handle:close()

  -- Extract the local file path from the 'p4 where' command output
  local paths = {}
  for path in string.gmatch(result, "%S+") do
    table.insert(paths, path)
  end
  local localPath = paths[#paths]

  -- Open the file in Neovim if the local path was successfully extracted
  if localPath and #localPath > 0 then
    vim.cmd("edit " .. localPath)
  else
    print("Could not find local path for " .. depotPath)
  end
end

-- Example command binding to use the function
vim.api.nvim_create_user_command("P4View", function(opts)
  OpenPerforceFileWithRevision(opts.args)
end, { nargs = 1 })
