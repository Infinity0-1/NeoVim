return {
  "nvim-treesitter/nvim-treesitter",
  enabled = false,
  event = "VeryLazy",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter').setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
      highlight = { enable = false, },
      indent = { enable = false },
      auto_install = false,
    })
  end,
}
