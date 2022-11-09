vim.cmd [[packadd packer.nvim]]
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-textsubjects',
    }
  }
  use {
    'romgrk/nvim-treesitter-context',
    config = function()
      require('treesitter-context.config').setup { enable = true }
    end
  }
  use 'm-demare/hlargs.nvim' -- improve hl for args
  use 'ThePrimeagen/refactoring.nvim'
  use {
    'ThePrimeagen/harpoon',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
    },
  }

  -- Completition
  -- use {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   opt = true,
  --   requires = {
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "quangnguyen30192/cmp-nvim-ultisnips",
  --     "hrsh7th/cmp-nvim-lua",
  --     "octaltree/cmp-look",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-calc",
  --     "f3fora/cmp-spell",
  --     -- "hrsh7th/cmp-emoji",
  --     "ray-x/cmp-treesitter",
  --     "hrsh7th/cmp-cmdline",
  --     "hrsh7th/cmp-nvim-lsp-document-symbol",
  --   },
  --   config = function()
  --     require("config.cmp").setup()
  --   end,
  -- }
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "onsails/lspkind-nvim",
      "L3MON4D3/LuaSnip",
    }
  }
  use 'windwp/nvim-autopairs'
  use 'tjdevries/colorbuddy.nvim'
  use {
    'williamboman/nvim-lsp-installer',
    -- 'williamboman/mason.nvim',
    -- 'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'ray-x/lsp_signature.nvim'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-file-browser.nvim' }
    }
  }
  use 'folke/todo-comments.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'arkav/lualine-lsp-progress'
  use 'akinsho/toggleterm.nvim'
  use 'akinsho/nvim-bufferline.lua' -- Customizable buffertabs
  use 'lukas-reineke/indent-blankline.nvim'
  use 'rafamadriz/friendly-snippets'
  -- Snippets
  -- use {
  --   "SirVer/ultisnips",
  --   requires = { { "honza/vim-snippets", rtp = "." }, "mlaursen/vim-react-snippets" },
  --   config = function()
  --     vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
  --     vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
  --     vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
  --     vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
  --     vim.g.UltiSnipsRemoveSelectModeMappings = 0
  --   end,
  -- }


  use 'skywind3000/asyncrun.vim' -- para realizar tareas asincronas
  use 'nvim-lua/popup.nvim'
  use 'voldikss/vim-floaterm' -- Floaterm
  use 'kyazdani42/nvim-tree.lua' -- File Tree
  use 'simrat39/symbols-outline.nvim' -- LSP Symbols tree
  -- use 'lewis6991/impatient.nvim'
  use 'vim-test/vim-test'

  -- THEMES
  use 'ellisonleao/gruvbox.nvim'
  use 'navarasu/onedark.nvim'
  -- use 'Mofiqul/dracula.nvim'
  use 'tanvirtin/monokai.nvim'
  use 'Shatur/neovim-ayu'
  -- use 'shaeinst/roshnivim-cs'
  -- use 'shaunsingh/moonlight.nvim'
  -- use 'Mofiqul/vscode.nvim'

  --use 'Raimondi/delimitMate'
  --use 'tpope/vim-surround'
  --use 'tpope/vim-fugitive'
  --use 'tpope/vim-repeat'
  --use 'tpope/vim-obsession'
  --use 'tpope/vim-vinegar'
  --use 'tpope/vim-eunuch'
  use 'tpope/vim-commentary'
  -- use 'lewis6991/gitsigns.nvim'
  -- use {
  --     'lewis6991/gitsigns.nvim',
  --     requires = {
  --         'nvim-lua/plenary.nvim'
  --     },
  --     config = function()
  --         require('config.signs')
  --     end
  -- }

  --use 'tpope/vim-tbone'

  use {
    'kristijanhusak/vim-dadbod-ui',
    requires = {
      'tpope/vim-dadbod',
      'tpope/vim-dotenv'
    }
  }

  use { 'nicwest/vim-http', opt = true, cmd = { 'Http' } }
  use { "ellisonleao/glow.nvim" }
  --use { 'vimwiki/vimwiki', opt = true, cmd = {'VimwikiIndex'}}

  -- Local plugins can be included
  --use '~/code/neovim/telescope-projectionist.nvim'
end)
