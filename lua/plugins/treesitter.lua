return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter').setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
      highlight = { enable = false, },
      indent = { enable = true },
      auto_install = false,
    })
  end,
}
