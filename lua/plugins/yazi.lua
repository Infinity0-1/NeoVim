return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>e",
      mode = { "n", "v" },
      ":Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>w",
      ":Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
  },

  opts = {
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
    },
  },

  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
}
