
require("which-key").setup({
  preset = "modern",
  delay = 800,
  win = {
    border = "rounded",
    padding = { 1, 5 },
    title = true,
    title_pos = "center",
    no_overlap = false,
  },

  layout = {
    width = { min = 10 },
    spacing = 1,
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
})

require("which-key").add({
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
