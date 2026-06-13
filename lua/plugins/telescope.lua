
require("telescope").setup({
  defaults = {
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "bottom",
      preview_width = 0.6,
    },
  },

  pickers = {
    find_files = {
      find_command = (vim.fn.executable("fd") == 1)
        and { "fd", "-u", "--type", "f", "--strip-cwd-prefix" }
        or nil,
    },
  },

  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },

    undo = {
        side_by_side = true,
        layout_strategy = "horizontal",
    },
  },
})
