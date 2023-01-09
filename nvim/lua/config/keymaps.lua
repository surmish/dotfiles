-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- better up/down
vim.keymap.set({ "n", "v", "x", "o" }, ";", "<Right>", { noremap = true, desc = "Move to the right" })
vim.keymap.set({ "n", "v", "x", "o" }, "l", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true, desc = "Move down during line wrap"})
vim.keymap.set({ "n", "v", "x", "o" }, "k", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true, desc = "Move up during line wrap"})
vim.keymap.set({ "n", "v", "x", "o" }, "j", "<Left>", { noremap = true, desc = "Move to the left" })

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
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set(
  "n",
  "<CR>",
  '&buftype ==# "nofile" ? "<CR>" : ":"',
  { expr = true, desc = "Return key enters command mode" }
)

vim.keymap.set("n", "<leader>so", function()
  vim.o.scrolloff = 18 - vim.o.scrolloff
end, { desc = "[so] Toggle scrolloff" })

vim.keymap.set("n", "<leader>nu", function()
  if vim.o.number then
    vim.o.number = false
    vim.o.relativenumber = false
  else
    vim.o.number = true
    vim.o.relativenumber = true
  end
end, { noremap = true, desc = "[nu] Toggle number display and relativenumbering" })

vim.keymap.set("n", "<leader>sc", function()
  if vim.o.signcolumn == "yes" then
    vim.o.signcolumn = "no"
  else
    vim.o.signcolumn = "yes"
  end
end, { noremap = true, desc = "[sc] Toggle sign column" })

-- vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, desc = "Exit if file not modified" })
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { noremap = true, desc = "Force exit irrespective of changes" })
vim.keymap.set("n", "<leader>x", ":x<CR>", { noremap = true, desc = "Close current buffer." })
vim.keymap.set("n", "<leader><C-h>", "<ESC>:set wrap!<CR>", { noremap = true, desc = "Toggle wrap around long lines" })
vim.keymap.set("n", "<leader>av", "ggvG$", { noremap = true, desc = "visually select the entire buffer" })
vim.keymap.set(
  "n",
  "<leader>ay",
  "maggvG$y'a",
  { noremap = true, desc = "yank all lines of the file and return to current position" }
)
-- vim.keymap.set('n', '<leader>y', '"+y',{ noremap=true, desc='yank into clipboard register'})
-- vim.keymap.set('n', '<leader>p', '"+p',{ noremap=true, desc='paste from clipboard register'})
vim.keymap.set("n", "<leader><tab>", ":bnext<CR>", { noremap = true, desc = "move to next buffer tab" })
vim.keymap.set("n", "<leader><S-tab>", ":bprev<CR>", { noremap = true, desc = "move to next buffer tab" })
vim.keymap.set("n", "<leader>t", "<ESC>:tn<CR>", { noremap = true, desc = "" })
vim.keymap.set("n", "<leader>edate", 'i <C-r>=strftime("%F")<CR><ESC>', { noremap = true, desc = "" })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = vim.api.nvim_create_augroup("fmt", { clear = true }),
--     pattern = { '*.C', '*.h', '*.rs' },
--     callback = function()
--         vim.lsp.buf.format()
--     end
-- })
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("Cursor", { clear = true }),
  callback = function()
    vim.opt_local.cursorline = true
    vim.opt_local.relativenumber = true
    -- vim.opt_local.cursorcolumn = true
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = vim.api.nvim_create_augroup("NoCursor", { clear = true }),
  callback = function()
    vim.opt_local.cursorline = false
    vim.opt_local.relativenumber = false
    -- vim.opt_local.cursorcolumn = false
  end,
})


