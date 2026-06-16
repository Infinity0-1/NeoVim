return {
  'dstein64/vim-startuptime',
  event = 'VeryLazy',
  init = function()
      vim.g.startuptime_tries = 3
  end,
}
