vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      {'nvim-lua/plenary.nvim'}
    },
    config = function()
      require("plugins.telescope")
    end
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup()
        vim.cmd('colorscheme rose-pine')
    end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  use "mfussenegger/nvim-dap"
  use "mfussenegger/nvim-dap-python"
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  use 'numToStr/Comment.nvim'

  use "lukas-reineke/indent-blankline.nvim"  -- отступы

  use 'tpope/vim-fugitive'         -- необходимость для некст
  use 'tpope/vim-rhubarb'          -- ссылочки на гитхаб
  use 'lewis6991/gitsigns.nvim'    -- подсветка что поменялось

  use {                            -- must have
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  }

  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)
