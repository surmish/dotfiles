-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
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
set_autoformat({ "lua" }, false)
set_autoformat({ "perl" }, false)
set_autoformat({ "yaml" }, false)
set_autoformat({ "python" }, false)

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
set_filetype({ "buildip*.config", "ip*.config", "*rtl.config", "*ip.config", "*.yml_old", "*.yml_new" }, "yaml")
set_filetype({ "cluster*.clk.config" }, "perl")
set_filetype({ "*.atelib", "*.tn" }, "tcl")
set_filetype({ "*.v", "*.vh" }, "systemverilog")

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.tex",
	callback = function()
		vim.api.nvim_command("!pdflatex % >/dev/null 2>&1")
		vim.api.nvim_command("redraw")
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("DiffModeColors", { clear = true }),
	pattern = { "*", "diff" },
	command = "if &diff | colorscheme moonbow | endif",
})

-- vim.api.nvim_create_autocmd({ "VimEnter", "BufRead", "BufNewFile" }, {
--   group = vim.api.nvim_create_augroup("p4filetypedetect", { clear = true }),
--   pattern = { "*" },
--   callback = function()
--     local first_line = vim.fn.getline(1)
--     if first_line:match("^Change") then
--       vim.bo.filetype = "diff"
--     end
--   end
-- })

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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "make,perl,tcl,tcsh,python",
	command = "setlocal tabstop=4 shiftwidth=4",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml",
  callback = function()
    local filepath = vim.api.nvim_buf_get_name(0)
    local filesize = vim.fn.getfsize(filepath)
    if filesize > (1024 * 1024) then
      vim.api.nvim_command("ownsyntax off")
      Snacks.indent.disable()
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	command = "highlight WinSeparator guifg=#556050",
})

-- vim.api.nvim_set_hl(0, "Comment", { fg = "#26A69A" })
-- vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
