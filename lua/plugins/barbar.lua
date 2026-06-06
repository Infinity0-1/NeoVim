return {
  "romgrk/barbar.nvim",
  version = "^1.0.0",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    animation = true,
    auto_hide = true,
    insert_at_end = false,
    insert_at_start = false,
    clickable = true,
    focus_on_close = "previous",
    exclude_ft = { "qf", "netrw" },
    sidebar_filetypes = {
      NvimTree = true,
    },

    gitsigns = {
        added = {enabled = true, icon = '+'},
        changed = {enabled = true, icon = '~'},
        deleted = {enabled = true, icon = '-'},
    },

    icons = {
      buffer_index = true,
      buffer_number = false,
      filetype = { enabled = true },
      modified = { button = "●" },
      separator = { left = "▎", right = "▎" },
    },
  },
}
