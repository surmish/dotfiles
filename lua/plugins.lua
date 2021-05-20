return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'folke/zen-mode.nvim' }
    use { 'sakhnik/nvim-gdb' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'karb94/neoscroll.nvim' }
    use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }
    use {'ms-jpq/chadtree', run = function()
      vim.fn.system("python3 -m chadtree deps")
      vim.cmd("CHADdeps")
    end}
end)
