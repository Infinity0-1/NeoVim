return {
  'stevearc/oil.nvim',
  event = "VeryLazy",
  opts = {
    watch_for_changes = true,
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
    columns = {
      { "permissions", highlight = "Special" },
      { "mtime", format = "%b %d %H:%M", highlight = "Comment" },
      { "size", highlight = "Number" },
      { "mtime", format = "%b %d %H:%M" },
    },

    view_options = {
      show_hidden = false,
    },
  },

  keys = { { "_", "<cmd>Oil<CR>", silent = true, desc = "Open Oil tree manager", }, },
}
