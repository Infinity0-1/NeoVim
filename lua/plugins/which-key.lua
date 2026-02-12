return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 350,
    win = {
      border = "rounded",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
      no_overlap = false,
    },

    layout = {
      width = { min = 24 },
      spacing = 4,
    },

    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },

    show_help = false,
    show_keys = true,
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>f", group = "+find" },
      { "<leader>g", group = "+git" },
      { "<leader>l", group = "+lsp" },
      { "<leader>s", group = "+search" },
      { "<leader>t", group = "+toggle" },
      { "<leader>b", group = "+buffer" },
      { "<leader>w", group = "+window" },
      { "<leader>c", group = "+code" },
      { "<leader>u", group = "+ui" },
      { "<leader>x", group = "+diagnostics" },
    })
  end,
}
