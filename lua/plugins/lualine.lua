return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons", "catppuccin/nvim" },
    config = function()
      local devicons = require("nvim-web-devicons")
      local filename_component = {
        function()
          local name = vim.fn.expand("%:t:r")
          local icon, icon_color = devicons.get_icon_color(vim.fn.expand("%:t"), vim.bo.filetype, { default = true })
          if icon then
            return icon .. " " .. name
          else
            return name
          end
        end,
        color = { fg = "#f5e0dc" },
        padding = { left = 1, right = 1 },
      }

      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "diff" },
          lualine_x = { filename_component },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { filename_component },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  }
}
