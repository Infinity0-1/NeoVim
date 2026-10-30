return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    preset = "helix",
    delay = 1000,
    Plugins = {
      registers = true,
      spelling = { enabled = true, suggestions = 20 },
      presets = {
        motions = true,
        windows = true,
        operators = true,
        text_objects = true,
        nav = true,
        z = true,
        g = true,
      },
    },

    win = {
      border = "rounded",
      padding = { 1, 2 },
      no_overlap = false,
      title_pos = "center",
      title = true,
    },

    layout = {
      width = { min = 20 },
      spacing = 3,
    },

    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
      mappings = true,
    },
  },
}
