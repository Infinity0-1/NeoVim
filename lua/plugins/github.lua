return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false,
  priority = 1000,
  config = function()
  require('github-theme').setup({
    options = {
      compile_path = vim.fn.stdpath('cache') .. '/github-theme',
      compile_file_suffix = '_compiled',
      hide_end_of_buffer = true,
      hide_nc_statusline = true,
      transparent = true,
      terminal_colors = true,
      dim_inactive = false,
      module_default = true,
      styles = {
        comments = 'NONE',
        functions = 'NONE',
        keywords = 'NONE',
        variables = 'NONE',
        conditionals = 'NONE',
        constants = 'NONE',
        numbers = 'NONE',
        operators = 'NONE',
        strings = 'NONE',
        types = 'NONE',
      },

      inverse = {
        match_paren = false,
        visual = false,
        search = false,
      },

      darken = {
        floats = true,
        sidebars = {
          enable = true,
          list = {},
        },
      },

      modules = {},
    },

    palettes = {},
    specs = {},
    groups = {
      all = {
        Pmenu = { bg = "NONE" },
        PmenuSel = { bg = "#777777" },
        PmenuSbar = { bg = "NONE" },
        PmenuThumb = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        FloatTitle = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        LineNr = { bg = "NONE" },
        CursorLineNr = { bg = "NONE" },
        FoldColumn = { bg = "NONE" },
      },
    },
  })

  vim.cmd('colorscheme github_dark')
  end,
}
