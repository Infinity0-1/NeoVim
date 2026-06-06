return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter').setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },
    })
  end,
}
