return {
  'stevearc/oil.nvim',
  event = "VeryLazy",
  opts = {
    columns = {
      "permissions",
      "size",
      { "mtime", format = "%a %b %d %H:%M:%S %Y" },
      "icon",
    },

    view_options = {
    show_hidden = true,
    },
  },

  keys = { { "_", "<cmd>Oil<CR>", silent = true, desc = "Open Oil tree manager", }, },
}
