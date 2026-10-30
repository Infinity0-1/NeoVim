return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled",
          transparent = true,
          terminal_colors = true,
          dim_inactive = false,
          module_default = true,
          colorblind = {
            enable = false,
            simulate_only = false,
            severity = {
              protan = 0,
              deutan = 0,
              tritan = 0,
            },
          },

          styles = {
            conditionals = "NONE",
            comments = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },

          inverse = {
            match_paren = false,
            visual = false,
            search = false,
          },

          modules_default = true,
        },

        palettes = {},
        specs = {},
        groups = {
          all = {
            Visual = { bg = "#2F3F5F" },
            YankyYanked = { bg = "#2F3F5F", fg = "NONE" },
            YankyPut    = { bg = "#2F3F5F", fg = "NONE" },
          },
        },
      })

    vim.cmd.colorscheme("carbonfox")
    end,
  },
}
