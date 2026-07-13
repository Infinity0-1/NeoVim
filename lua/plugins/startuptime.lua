return {
  'dstein64/vim-startuptime',
  lazy = true,
  event = 'VeryLazy',
  init = function()
      vim.g.startuptime_tries = 10
  end,
}
