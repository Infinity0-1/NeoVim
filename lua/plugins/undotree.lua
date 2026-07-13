return {
  {
    "jiaoshijie/undotree",
    opts = {},
    keys = {
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },

  {
    "debugloop/telescope-undo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("undo")
      vim.keymap.set("n", "<leader>U", "<cmd>Telescope undo<cr>")
    end,
  },
}
