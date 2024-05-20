-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- stylua: ignore start
vim.keymap.set({ "n", "v", "x", "o" }, ";", "<Right>"                  , { noremap = true, desc = "Move to the right" })
vim.keymap.set({ "n", "v", "x", "o" }, "l", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, desc = "Move down during line wrap" })
vim.keymap.set({ "n", "v", "x", "o" }, "k", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, desc = "Move up during line wrap" })
vim.keymap.set({ "n", "v", "x", "o" }, "j", "<Left>"                   , { noremap = true, desc = "Move to the left" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-w>;", ":wincmd l<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>l", ":wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>k", ":wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>j", ":wincmd h<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-w>:", ":wincmd L<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>L", ":wincmd K<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>K", ":wincmd J<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>J", ":wincmd H<CR>", { noremap = true, silent = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>"   , "<cmd>resize +2<CR>"         , { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>" , "<cmd>resize -2<CR>"         , { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>" , "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- resize windows
vim.keymap.set("n", "<leader>w<", "30<C-w><", { desc = "Move right window border by 30 to the left" })
vim.keymap.set("n", "<leader>w>", "30<C-w>>", { desc = "Move right window border by 30 to the right" })
vim.keymap.set("n", "<leader>w+", "10<C-w>+", { desc = "Lower bottom window border by 10" })
vim.keymap.set("n", "<leader>w-", "10<C-w>-", { desc = "Raise bottom window border by 10" })

vim.keymap.set("n", "<CR>", '&buftype ==# "nofile" ? "<CR>" : ":"', { expr = true, desc = "Return key enters command mode" })
-- stylua: ignore end

-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>update<cr><esc>", { noremap = true, desc = "Save file" })

vim.keymap.set("n", "<leader>so", function()
  vim.o.scrolloff = 25 - vim.o.scrolloff
end, { desc = "[so] Toggle scrolloff" })

vim.keymap.set("n", "<leader>nu", function()
  if vim.o.number then
    vim.o.number = false
    vim.o.relativenumber = false
  else
    vim.o.number = true
    vim.o.relativenumber = true
  end
end, { noremap = true, desc = "[nu] Toggle number display and relativenumbers" })

vim.keymap.set("n", "<leader>sc", function()
  if vim.o.signcolumn == "yes" then
    vim.o.signcolumn = "no"
  else
    vim.o.signcolumn = "yes"
  end
end, { noremap = true, desc = "[sc] Toggle sign column" })

-- stylua: ignore start
-- vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, desc = "Exit if file not modified" })
vim.keymap.set("n", "<leader>Q"     ,":q!<CR>"             , { noremap = true, desc = "Force exit irrespective of changes"     })
vim.keymap.set("n", "<leader>x"     ,":x<CR>"              , { noremap = true, desc = "Close current buffer."                  })
vim.keymap.set("n", "<leader><C-h>" ,"<ESC>:set wrap!<CR>" , { noremap = true, desc = "Toggle wrap around long lines"          })
-- stylua: ignore end

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("Cursor", { clear = true }),
  callback = function()
    vim.opt_local.cursorline = true
    vim.opt_local.relativenumber = true
    vim.opt_local.cursorcolumn = true
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = vim.api.nvim_create_augroup("NoCursor", { clear = true }),
  callback = function()
    vim.opt_local.cursorline = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorcolumn = false
  end,
})

-- Auto indent on empty line.
vim.keymap.set("n", "i", function()
  return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "cc" or "i"
end, { expr = true, noremap = true })

vim.keymap.set('n', '<leader>h', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
