return {
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      {
        "<leader>u",
        "<cmd>Telescope undo<cr>",
        desc = "Undo history",
      },
    },
    opts = {
      extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = "horizontal",
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("undo")
    end,
  },
}
