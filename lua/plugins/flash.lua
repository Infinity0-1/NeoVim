return{
  "folke/flash.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
  modes = {
      char = { enabled = false, },
    },
  },

  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
