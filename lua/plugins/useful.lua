return
{
  {
    'dstein64/vim-startuptime',
    event = 'VeryLazy',
    init = function()
      vim.g.startuptime_tries = 5
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  }
}
