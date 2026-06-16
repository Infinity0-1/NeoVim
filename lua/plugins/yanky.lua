return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
      require("yanky").setup()
  end,
}
