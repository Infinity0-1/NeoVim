
local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({

    { src = gh('edeneast/nightfox.nvim') , name = 'Theme' },

    { src = gh('sharkdp/fd') },
    { src = gh('nvim-lua/plenary.nvim') },
    { src = gh('nvim-tree/nvim-web-devicons') },
    { src = gh('debugloop/telescope-undo.nvim') },
    { src = gh('nvim-telescope/telescope-fzf-native.nvim') },
    { src = gh('nvim-telescope/telescope.nvim') , name = 'Telescope' },

    { src = gh('nvim-treesitter/nvim-treesitter') , name = 'Treesitter' },

    { src = gh('mason-org/mason.nvim') },
    { src = gh('mason-org/mason-lspconfig.nvim') },
    { src = gh('neovim/nvim-lspconfig') , name = 'LSP + Mason' },

    { src = gh('saadparwaiz1/cmp_luasnip') },
    { src = gh('hrsh7th/cmp-nvim-lsp') },
    { src = gh('hrsh7th/cmp-buffer') },
    { src = gh('hrsh7th/cmp-path') },
    { src = gh('L3MON4D3/LuaSnip') },
    { src = gh('hrsh7th/cmp-cmdline') },
    { src = gh('hrsh7th/nvim-cmp') , name = 'Completions' },

    { src = gh('folke/flash.nvim') },
    { src = gh('gbprod/yanky.nvim') },
    { src = gh('nvim-mini/mini.icons') },
    { src = gh('folke/which-key.nvim') },
    { src = gh('windwp/nvim-autopairs') },
    { src = gh('lewis6991/gitsigns.nvim') },
    { src = gh('dstein64/vim-startuptime') },
    { src = gh('folke/todo-comments.nvim') },
})

require ("plugins.nightfox")
require ("plugins.cmp")
require ("plugins.mason")
require ("plugins.flash")
require ("plugins.yanky")
require ("plugins.whichkey")
require ("plugins.telescope")

require ("gitsigns").setup()
require ("nvim-autopairs").setup()
require ("mason-lspconfig").setup()
require ("telescope").load_extension("undo")
require ('nvim-treesitter').setup { install_dir = vim.fn.stdpath('data') .. '/site' }
