vim.cmd[[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
]]

require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'folke/zen-mode.nvim' }
    use { 'sakhnik/nvim-gdb' }
    use { 'karb94/neoscroll.nvim' }
    use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }
    use {'ms-jpq/chadtree', run = function()
      vim.fn.system("python3 -m chadtree deps")
      vim.cmd("CHADdeps")
    end}
    use { 'folke/tokyonight.nvim' }
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
    use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
end)

require('lualine').setup()

require("zen-mode").setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    width = 0.8, -- width of the Zen window
    height = 0.8, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = { 
    tmux = { enabled = true },
  }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}

require('neoscroll').setup()

-- require('bufferline').setup {
--   options = {
--     numbers = "ordinal" ,
--     number_style = { "none", "none" }, -- buffer_id at index 1, ordinal at index 2
--     mappings = true ,
--     diagnostics = "nvim_lsp",
--     persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
--     -- can also be a table containing 2 custom separators
--     -- [focused and unfocused]. eg: { '|', '|' }
--     show_buffer_icons = false,
--     separator_style = { '', '' },
--   }
-- }

vim.cmd [[
nnoremap <F7> :CHADopen<CR>
set clipboard+=unnamedplus
let g:tokyonight_style = "night"
let g:tokyonight_italic_comments = 0
let g:tokyonight_italic_keywords = 0
let g:tokyonight_italic_functions = 0
let g:tokyonight_hide_inactive_statusline = 1
let g:gruvbox_italic = 0
let g:gruvbox_italicize_comments = 0
let g:gruvbox_italicize_strings = 0

function! CustomizeColors()
 exec 'highlight CursorLine    ctermbg=236 guibg=#444444 cterm=none gui=none'
 exec 'highlight CursorColumn  ctermbg=236 guibg=#444444'
endfunction
augroup OnColorScheme
	autocmd!
	autocmd ColorScheme,BufEnter,BufWinEnter * call CustomizeColors()
augroup END

colorscheme gruvbox-material
" colorscheme tokyonight
" highlight CursorLine    ctermbg=236 guibg=#444444 cterm=none gui=none
" highlight CursorColumn  ctermbg=236 guibg=#444444
]]
