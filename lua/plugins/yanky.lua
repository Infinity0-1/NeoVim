return {
  "gbprod/yanky.nvim",
  lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {},
  keys = {
  { "<c-n>", "<Plug>(YankyCycleForward)" },
  { "<c-p>", "<Plug>(YankyCycleBackward)" },
  { "<Space>p", "<cmd>Telescope yank_history<cr>" },
  },
}
