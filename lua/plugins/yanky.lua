return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  opts = {
    ring = {
      history_length = 100,
      storage = "shada",
      sync_with_numbered_registers = true,
      cancel_event = "update",
      ignore_registers = { "_" },
      update_register_on_cycle = false,
    },

    picker = {
      select = { action = nil },
      telescope = {
        use_default_mappings = true,
        mappings = nil,
      },
    },

    system_clipboard = {
      sync_with_ring = true,
      clipboard_register = nil,
    },

    highlight = {
      on_put = true,
      on_yank = false,
      timer = 200,
    },

    preserve_cursor_position = {
      enabled = true,
    },
  },

  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before" },
    { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Previous yank entry" },
    { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Next yank entry" },
  },
}
