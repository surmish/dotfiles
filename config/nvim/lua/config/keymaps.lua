-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- stylua: ignore start
vim.keymap.del({ "n", "v"}, "h")
vim.keymap.set({ "n", "v", "x", "o" }, "j", "<Left>"                   , { noremap = true, desc = "Move to the left" })
vim.keymap.set({ "n", "v", "x", "o" }, "k", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, desc = "Move up during line wrap" })
vim.keymap.set({ "n", "v", "x", "o" }, "l", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, desc = "Move down during line wrap" })
vim.keymap.set({ "n", "v", "x", "o" }, ";", "<Right>"                  , { noremap = true, desc = "Move to the right" })

vim.keymap.set("n", "<C-W>j", ":wincmd h<CR>", { noremap = true, silent = true, desc = "Go to the left window"  })
vim.keymap.set("n", "<C-W>k", ":wincmd j<CR>", { noremap = true, silent = true, desc = "Go to the window below" })
vim.keymap.set("n", "<C-W>l", ":wincmd k<CR>", { noremap = true, silent = true, desc = "Go to the window above" })
vim.keymap.set("n", "<C-W>;", ":wincmd l<CR>", { noremap = true, silent = true, desc = "Go to the right window" })
vim.keymap.set("n", "<C-W>J", ":wincmd H<CR>", { noremap = true, silent = true, desc = "Move current window to far left"  })
vim.keymap.set("n", "<C-W>K", ":wincmd J<CR>", { noremap = true, silent = true, desc = "Move current window to the top"   })
vim.keymap.set("n", "<C-W>L", ":wincmd K<CR>", { noremap = true, silent = true, desc = "Move current window to the bottom"})
vim.keymap.set("n", "<C-W>:", ":wincmd L<CR>", { noremap = true, silent = true, desc = "Move current window to far right" })

vim.keymap.set("n", "<CR>", '&buftype ==# "nofile" ? "<CR>" : ":"', { expr = true, desc = "Return key enters command mode" })
-- stylua: ignore end

vim.keymap.set("n", "<leader>so", function() vim.o.scrolloff = 15 - vim.o.scrolloff end, { desc = "Toggle scrolloff" })

vim.keymap.set("n", "<leader>sc", function()
  if vim.o.signcolumn == "yes" then
    vim.o.signcolumn = "no"
  else
    vim.o.signcolumn = "yes"
  end
end, { noremap = true, desc = "Toggle sign column" })

-- stylua: ignore start
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { noremap = true, desc = "Force exit irrespective of changes"})
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>update<cr><esc>", { noremap = true, desc = "Save file" })
-- stylua: ignore end

-- Auto indent on empty line.
vim.keymap.set("n", "i", function() return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "cc" or "i" end, { expr = true, noremap = true })
