return {
  "stevearc/oil.nvim",
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
  },

  opts = {
    default_file_explorer = true,
    columns = { "icon" },
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
    },

    win_options = {
      wrap = false,
      signcolumn = "no",
      cursorcolumn = false,
      foldcolumn = "0",
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = "nvic",
    },

    delete_to_trash = false,
    skip_confirm_for_simple_edits = false,
    prompt_save_on_select_new_entry = true,
    cleanup_delay_ms = 2000,
    constrain_cursor = "editable",
    watch_for_changes = false,
    view_options = {
      show_hidden = false,
      natural_order = "fast",
      case_insensitive = false,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
    },
  },
}
