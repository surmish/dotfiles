-- This file is automatically loaded by plugins.config

local util = require("lazyvim.util")

-- navigate command keymaps
vim.keymap.set({ "n", "v", "x", "o" }, ";", "<Right>", { noremap = true, desc = "Move to the right" })
vim.keymap.set({ "n", "v", "x", "o" }, "l", "<Up>", { noremap = true, desc = "Move up" })
vim.keymap.set({ "n", "v", "x", "o" }, "k", "<Down>", { noremap = true, desc = "Move down" })
vim.keymap.set({ "n", "v", "x", "o" }, "j", "<Left>", { noremap = true, desc = "Move to the left" })
vim.keymap.set({ "n", "v", "x", "o" }, "gk", "gj", { noremap = true, desc = "Move down during line wrap" })
vim.keymap.set({ "n", "v", "x", "o" }, "gl", "gk", { noremap = true, desc = "Move up during line wrap" })

vim.keymap.set("n", "<C-w>;", ":wincmd l<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>l", ":wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>k", ":wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>j", ":wincmd h<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-w>:", ":wincmd L<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>L", ":wincmd K<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>K", ":wincmd J<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>J", ":wincmd H<CR>", { noremap = true, silent = true })

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

-- Remap for dealing with word wrap
-- jk -> kl for me
vim.keymap.set("n", "k", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "l", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

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

-- -- Move to window using the <meta> movement keys
-- vim.keymap.set("n", "<A-left>", "<C-w>h")
-- vim.keymap.set("n", "<A-down>", "<C-w>j")
-- vim.keymap.set("n", "<A-up>", "<C-w>k")
-- vim.keymap.set("n", "<A-right>", "<C-w>l")

-- -- Resize window using <shift> arrow keys
-- vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>")
-- vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>")
-- vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
-- vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- Move Lines
vim.keymap.set("n", "<A-k>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv")
vim.keymap.set("i", "<A-k>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("n", "<A-l>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-l>", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<A-l>", "<Esc>:m .-2<CR>==gi")

-- -- Switch buffers with <ctrl>
-- vim.keymap.set("n", "<C-Left>", "<cmd>bprevious<cr>")
-- vim.keymap.set("n", "<C-Right>", "<cmd>bnext<cr>")

-- Easier pasting
vim.keymap.set("n", "[p", ":pu!<cr>")
vim.keymap.set("n", "]p", ":pu<cr>")

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set("n", "gw", "*N")
vim.keymap.set("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- save in insert mode
vim.keymap.set("i", "<C-s>", "<cmd>:update<cr><esc>")
vim.keymap.set("n", "<C-s>", "<cmd>:update<cr><esc>")

-- change current word
vim.keymap.set("n", "<C-c>", "<cmd>normal ciw<cr>a")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open Quickfix List" })

-- stylua: ignore start

-- toggle options
vim.keymap.set("n", "<leader>tf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Format on Save" })
vim.keymap.set("n", "<leader>ts", function() util.toggle("spell") end, { desc = "Spelling" })
vim.keymap.set("n", "<leader>tw", function() util.toggle("wrap") end, { desc = "Word Wrap" })
vim.keymap.set("n", "<leader>tn", function() util.toggle("relativenumber", true) util.toggle("number") end, { desc = "Line Numbers" })

-- lazygit
vim.keymap.set("n", "<leader>gg", function() require("lazyvim.util").float_term({ "lazygit" }) end, { desc = "Lazygit (cwd)" })
vim.keymap.set("n", "<leader>gG", function() util.float_term({ "lazygit" }, { cwd = util.get_root() }) end, { desc = "Lazygit (root dir)" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  vim.keymap.set("n", "<leader>hl", vim.show_pos, { desc = "Highlight Groups at cursor" })
end

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "other-window" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "delete-window" })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "split-window-below" })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "split-window-right" })

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<CR>", { desc = "Last" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<CR>", { desc = "First" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<CR>", { desc = "Next" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<CR>", { desc = "Close" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<CR>", { desc = "Previous" })

-- buffers
vim.keymap.set("n", "<leader>b]", "<cmd>:BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>:e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>b[", "<cmd>:BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>:e #<cr>", { desc = "Switch to Other Buffer" })
