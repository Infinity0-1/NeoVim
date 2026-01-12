return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons", "catppuccin/nvim" },
    config = function()
      local devicons = require("nvim-web-devicons")
      local date = { "datetime", style = "%H:%M" }
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
      local battery_component = {
        function()
          local cap = io.open("/sys/class/power_supply/BAT1/capacity", "r")
          if not cap then
            return ""
          end
          local capacity = cap:read("*a"):gsub("%s+", "")
          cap:close()
          return capacity
        end,
        color = { fg = "#f5e0dc" },
        padding = { left = 1, right = 1 },
      }

      require("lualine").setup({
        options = {
          theme = "catppuccin",
          icons_enabled = true,
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
                refresh_time = 3,
                events = {
                  'WinEnter',
                  'BufEnter',
                  'BufWritePost',
                  'SessionLoadPost',
                  'FileChangedShellPost',
                  'VimResized',
                  'Filetype',
                  'CursorMoved',
                  'CursorMovedI',
                  'ModeChanged',
                },
          }
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "progress"},
          lualine_c = { "diff" },
          lualine_x = { filename_component },
          lualine_y = { battery_component },
          lualine_z = { date },
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
