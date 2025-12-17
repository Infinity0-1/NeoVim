return {
  "gbprod/yanky.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {},
  keys = {
  { "<c-n>", "<Plug>(YankyCycleForward)" },
  { "<c-p>", "<Plug>(YankyCycleBackward)" },
  { "<leader>p", "<cmd>Telescope yank_history<cr>" },
  },
}
