return {
  "debugloop/telescope-undo.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("undo")
  end,
   opts = {
     extensions = {
       undo = {
         side_by_side = true,
         layout_strategy = "horizontal",
       },
     },
   },

}
