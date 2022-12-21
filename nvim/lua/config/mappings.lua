---@diagnostic disable: missing-parameter

local util = require("util")
local wk = require("which-key")

-- vim.o.timeoutlen = 300

wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "SPC" },
})

-- local id
-- for _, key in ipairs({ "h", "j", "k", "l" }) do
--   local count = 0
--   vim.keymap.set("n", key, function()
--     if count >= 10 then
--       id = vim.notify("Hold it Cowboy!", vim.log.levels.WARN, {
--         icon = "",
--         replace = id,
--         keep = function()
--           return count >= 10
--         end,
--       })
--     else
--       count = count + 1
--       vim.defer_fn(function()
--         count = count - 1
--       end, 5000)
--       return key
--     end
--   end, { expr = true })
-- end

-- -- Move to window using the <ctrl> movement keys
-- vim.keymap.set("n", "<left>", "<C-w>h")
-- vim.keymap.set("n", "<down>", "<C-w>j")
-- vim.keymap.set("n", "<up>", "<C-w>k")
-- vim.keymap.set("n", "<right>", "<C-w>l")

-- -- Resize window using <ctrl> arrow keys
-- vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>")
-- vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>")
-- vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
-- vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- -- Move Lines
-- vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
-- vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
-- vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
-- vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- -- Switch buffers with tab
-- vim.keymap.set("n", "<C-Left>", "<cmd>bprevious<cr>")
-- vim.keymap.set("n", "<C-Right>", "<cmd>bnext<cr>")

-- -- Easier pasting
-- -- vim.keymap.set("n", "[p", ":pu!<cr>")
-- -- vim.keymap.set("n", "]p", ":pu<cr>")

-- -- Clear search with <esc>
-- vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
-- vim.keymap.set("n", "gw", "*N")
-- vim.keymap.set("x", "gw", "*N")

-- -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- -- Add undo break-points
-- vim.keymap.set("i", ",", ",<c-g>u")
-- vim.keymap.set("i", ".", ".<c-g>u")
-- vim.keymap.set("i", ";", ";<c-g>u")

-- -- save in insert mode
-- vim.keymap.set("i", "<C-s>", "<cmd>:w<cr><esc>")
-- vim.keymap.set("n", "<C-s>", "<cmd>:w<cr><esc>")
-- vim.keymap.set("n", "<C-c>", "<cmd>normal ciw<cr>a")

-- -- telescope <ctrl-r> in command line
-- -- vim.cmd([[cmap <C-R> <Plug>(TelescopeFuzzyCommandSearch)]])

-- -- better indenting
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("v", ">", ">gv")

-- vim.keymap.set("n", "<space>cu", function()
--   local number = math.random(math.pow(2, 127) + 1, math.pow(2, 128))
--   return "i" .. string.format("%.0f", number)
-- end, {
--   expr = true,
--   desc = "GUID",
-- })

-- -- makes * and # work on visual mode too.
-- vim.cmd([[
--   function! g:VSetSearch(cmdtype)
--     let temp = @s
--     norm! gv"sy
--     let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
--     let @s = temp
--   endfunction
--   xnoremap * :<C-u>call g:VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
--   xnoremap # :<C-u>call g:VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
-- ]])

-- local leader = {
--   ["w"] = {
--     name = "+windows",
--     ["w"] = { "<C-W>p", "other-window" },
--     ["d"] = { "<C-W>c", "delete-window" },
--     ["-"] = { "<C-W>s", "split-window-below" },
--     ["|"] = { "<C-W>v", "split-window-right" },
--     ["2"] = { "<C-W>v", "layout-double-columns" },
--     ["h"] = { "<C-W>h", "window-left" },
--     ["j"] = { "<C-W>j", "window-below" },
--     ["l"] = { "<C-W>l", "window-right" },
--     ["k"] = { "<C-W>k", "window-up" },
--     ["H"] = { "<C-W>5<", "expand-window-left" },
--     ["J"] = { ":resize +5", "expand-window-below" },
--     ["L"] = { "<C-W>5>", "expand-window-right" },
--     ["K"] = { ":resize -5", "expand-window-up" },
--     ["="] = { "<C-W>=", "balance-window" },
--     ["s"] = { "<C-W>s", "split-window-below" },
--     ["v"] = { "<C-W>v", "split-window-right" },
--   },
--   c = {
--     name = "+code",
--   },
--   b = {
--     name = "+buffer",
--     ["b"] = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
--     ["p"] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
--     ["["] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
--     ["n"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
--     ["]"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
--     -- ["D"] = { "<cmd>:bd<CR>", "Delete Buffer & Window" },
--   },
--   g = {
--     name = "+git",
--     l = {
--       function()
--         require("util").float_terminal("lazygit", { border = "none" })
--       end,
--       "LazyGit",
--     },
--     c = { "<Cmd>Telescope git_commits<CR>", "commits" },
--     b = { "<Cmd>Telescope git_branches<CR>", "branches" },
--     s = { "<Cmd>Telescope git_status<CR>", "status" },
--     d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
--     h = { name = "+hunk" },
--   },
--   ["h"] = {
--     name = "+help",
--     t = { "<cmd>:Telescope builtin<cr>", "Telescope" },
--     c = { "<cmd>:Telescope commands<cr>", "Commands" },
--     h = { "<cmd>:Telescope help_tags<cr>", "Help Pages" },
--     m = { "<cmd>:Telescope man_pages<cr>", "Man Pages" },
--     k = { "<cmd>:Telescope keymaps<cr>", "Key Maps" },
--     s = { "<cmd>:Telescope highlights<cr>", "Search Highlight Groups" },
--     l = { vim.show_pos, "Highlight Groups at cursor" },
--     f = { "<cmd>:Telescope filetypes<cr>", "File Types" },
--     o = { "<cmd>:Telescope vim_options<cr>", "Options" },
--     a = { "<cmd>:Telescope autocommands<cr>", "Auto Commands" },
--     p = {
--       name = "+packer",
--       p = { "<cmd>PackerSync<cr>", "Sync" },
--       s = { "<cmd>PackerStatus<cr>", "Status" },
--       i = { "<cmd>PackerInstall<cr>", "Install" },
--       c = { "<cmd>PackerCompile<cr>", "Compile" },
--     },
--   },
--   s = {
--     name = "+search",
--     g = { "<cmd>Telescope live_grep<cr>", "Grep" },
--     b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
--     s = {
--       function()
--         require("telescope.builtin").lsp_document_symbols({
--           symbols = {
--             "Class",
--             "Function",
--             "Method",
--             "Constructor",
--             "Interface",
--             "Module",
--             "Struct",
--             "Trait",
--             "Field",
--             "Property",
--           },
--         })
--       end,
--       "Goto Symbol",
--     },
--     h = { "<cmd>Telescope command_history<cr>", "Command History" },
--     m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
--     r = { "<cmd>lua require('spectre').open()<CR>", "Replace (Spectre)" },
--   },
--   f = {
--     name = "+file",
--     t = { "<cmd>Neotree toggle<cr>", "NeoTree" },
--     f = { "<cmd>Telescope find_files<cr>", "Find File" },
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--     n = { "<cmd>enew<cr>", "New File" },
--     z = "Zoxide",
--     d = "Dot Files",
--   },
--   o = {
--     name = "+open",
--     p = { "<cmd>Peek<cr>", "Peek (Markdown Preview)" },
--     g = { "<cmd>Glow<cr>", "Markdown Glow" },
--     n = { "<cmd>lua require('github-notifications.menu').notifications()<cr>", "GitHub Notifications" },
--   },
--   p = {
--     name = "+project",
--     p = "Open Project",
--     b = { ":Telescope file_browser cwd=~/projects<CR>", "Browse ~/projects" },
--   },
--   t = {
--     name = "toggle",
--     f = {
--       require("config.plugins.lsp.formatting").toggle,
--       "Format on Save",
--     },
--     s = {
--       function()
--         util.toggle("spell")
--       end,
--       "Spelling",
--     },
--     w = {
--       function()
--         util.toggle("wrap")
--       end,
--       "Word Wrap",
--     },
--     n = {
--       function()
--         util.toggle("relativenumber", true)
--         util.toggle("number")
--       end,
--       "Line Numbers",
--     },
--   },
--   ["<tab>"] = {
--     name = "tabs",
--     ["<tab>"] = { "<cmd>tabnew<CR>", "New Tab" },
--     n = { "<cmd>tabnext<CR>", "Next" },
--     d = { "<cmd>tabclose<CR>", "Close" },
--     p = { "<cmd>tabprevious<CR>", "Previous" },
--     ["]"] = { "<cmd>tabnext<CR>", "Next" },
--     ["["] = { "<cmd>tabprevious<CR>", "Previous" },
--     f = { "<cmd>tabfirst<CR>", "First" },
--     l = { "<cmd>tablast<CR>", "Last" },
--   },
--   ["`"] = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
--   [" "] = "Find File",
--   ["."] = { ":Telescope file_browser<CR>", "Browse Files" },
--   [","] = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
--   ["/"] = { "<cmd>Telescope live_grep<cr>", "Search" },
--   [":"] = { "<cmd>Telescope command_history<cr>", "Command History" },
--   ["C"] = {
--     function()
--       util.clipman()
--     end,
--     "Paste from Clipman",
--   },
--   q = {
--     name = "+quit/session",
--     q = { "<cmd>qa<cr>", "Quit" },
--     ["!"] = { "<cmd>:qa!<cr>", "Quit without saving" },
--     s = { [[<cmd>lua require("persistence").load()<cr>]], "Restore Session" },
--     l = { [[<cmd>lua require("persistence").load({last=true})<cr>]], "Restore Last Session" },
--     d = { [[<cmd>lua require("persistence").stop()<cr>]], "Stop Current Session" },
--   },
--   x = {
--     name = "+errors",
--     x = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble" },
--     t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
--     tt = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", "Todo Trouble" },
--     T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
--     l = { "<cmd>lopen<cr>", "Open Location List" },
--     q = { "<cmd>copen<cr>", "Open Quickfix List" },
--   },
--   z = { [[<cmd>ZenMode<cr>]], "Zen Mode" },
--   T = {
--     function()
--       util.test(true)
--     end,
--     "Plenary Test File",
--   },
--   D = {
--     function()
--       util.test()
--     end,
--     "Plenary Test Directory",
--   },
-- }

-- for i = 0, 10 do
--   leader[tostring(i)] = "which_key_ignore"
-- end

wk.register(leader, { prefix = "<leader>" })
wk.register({ g = { name = "+goto" } })

vim.keymap.set('n', '<leader>so', function()
  vim.o.scrolloff = 18 - vim.o.scrolloff
end, { desc = '[so] Toggle scrolloff' })

vim.keymap.set('n', '<leader>nu', function()
  if vim.o.number then
    vim.o.number = false
    vim.o.relativenumber = false
  else
    vim.o.number = true
    vim.o.relativenumber = true
  end
end,{ noremap=true,desc='[nu] Toggle number display and relativenumbering' })

vim.keymap.set('n', '<leader>sc', function()
  if vim.o.signcolumn == "yes" then
    vim.o.signcolumn = "no"
  else
    vim.o.signcolumn = "yes"
  end
end, { noremap=true, desc = '[sc] Toggle sign column' })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'l', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set('n', '<leader>ww', ':update!<CR>',{ noremap=true, desc='Write only if buffer modified.' })
vim.keymap.set('n', '<leader>q', ':q<CR>',{ noremap=true, desc='Exit if file not modified' })
vim.keymap.set('n', '<leader>Q', ':q!<CR>',{ noremap=true, desc='Force exit irrespective of changes'})
vim.keymap.set('n', '<leader>x', ':x<CR>',{ noremap=true, desc='Close current buffer.'})
vim.keymap.set('n', '<leader><C-h>', '<ESC>:set wrap!<CR>',{ noremap=true, desc='Toggle wrap around long lines'})
vim.keymap.set('n', '<leader>av', "ggvG$",{ noremap=true, desc='visually select the entire buffer'})
vim.keymap.set('n', '<leader>ay', "maggvG$y'a",{ noremap=true, desc='yank all lines of the file and return to current position'})
-- vim.keymap.set('n', '<leader>y', '"+y',{ noremap=true, desc='yank into clipboard register'})
-- vim.keymap.set('n', '<leader>p', '"+p',{ noremap=true, desc='paste from clipboard register'})
vim.keymap.set('n', '<leader><tab>', ':bnext<CR>',{ noremap=true, desc='move to next buffer tab'})
vim.keymap.set('n', '<leader><S-tab>', ':bprev<CR>',{ noremap=true, desc='move to next buffer tab'})
vim.keymap.set('n', '<leader>t', '<ESC>:tn<CR>',{ noremap=true, desc=''})
vim.keymap.set('n', '<leader>edate', 'i <C-r>=strftime("%F")<CR><ESC>',{ noremap=true, desc=''})

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = vim.api.nvim_create_augroup("fmt", { clear = true }),
--     pattern = { '*.C', '*.h', '*.rs' },
--     callback = function()
--         vim.lsp.buf.format()
--     end
-- })
vim.api.nvim_create_autocmd({"WinEnter","BufWinEnter"}, {
    group = vim.api.nvim_create_augroup("Cursor", { clear = true }),
    callback = function()
        vim.opt_local.cursorline = true
        vim.opt_local.cursorcolumn = true
    end
})
vim.api.nvim_create_autocmd("WinLeave", {
    group = vim.api.nvim_create_augroup("NoCursor", { clear = true }),
    callback = function()
        vim.opt_local.cursorline = false
        vim.opt_local.cursorcolumn = false
    end
})


-- navigate command keymaps
vim.keymap.set({'n', 'v', 'x', 'o'}, ';', '<Right>',{ noremap=true, desc='Move to the right' })
vim.keymap.set({'n', 'v', 'x', 'o'}, 'l', '<Up>',   { noremap=true, desc='Move up' })
vim.keymap.set({'n', 'v', 'x', 'o'}, 'k', '<Down>', { noremap=true, desc='Move down' })
vim.keymap.set({'n', 'v', 'x', 'o'}, 'j', '<Left>', { noremap=true, desc='Move to the left' })
vim.keymap.set({'n', 'v', 'x', 'o'}, 'gk', 'gj', { noremap=true, desc='Move down during line wrap' })
vim.keymap.set({'n', 'v', 'x', 'o'}, 'gl', 'gk', { noremap=true, desc='Move up during line wrap' })

vim.keymap.set('n', '<C-w>;', ':wincmd l<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<C-w>l', ':wincmd k<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<C-w>k', ':wincmd j<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<C-w>j', ':wincmd h<CR>', { noremap=true, silent=true })

vim.keymap.set('n', '<C-w>:', ':wincmd L<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<C-w>L', ':wincmd K<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<C-w>K', ':wincmd J<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<C-w>J', ':wincmd H<CR>', { noremap=true, silent=true })

vim.keymap.set('n', '<CR>', '&buftype ==# "nofile" ? "<CR>" : ":"', { expr=true, desc='Return key enters command mode' })
