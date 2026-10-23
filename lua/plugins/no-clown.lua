return {
  "aktersnurra/no-clown-fiesta.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("no-clown-fiesta").setup({
      theme = "dark",
      transparent = true,
      styles = {
        comments = {},
        functions = {},
        keywords = {},
        lsp = { underline = false },
        match_paren = { underline = true },
        type = { bold = true },
        variables = {},
      },
    })
  end,
}
