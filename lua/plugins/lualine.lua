return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  priority = 999,
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    local devicons = require("nvim-web-devicons")
    local date = { "datetime", style = "%H:%M" }
    local filename_component = {
      function()
        if vim.bo.buftype == "terminal" then
          return "Terminal"
        end
        if vim.bo.filetype == "oil" then
          return "Oil Navigator"
        end
        local name = vim.fn.expand("%:~")
        local icon, icon_color = devicons.get_icon_color(
          vim.fn.expand("%"),
          vim.bo.filetype,
          { default = false }
        )

        if icon then
          return icon .. " " .. name
        else
          return name
        end
      end,
      color = { fg = "#efefef" },
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
        return capacity .. "%%"
      end,
      color = { fg = "#ffffff" },
      padding = { left = 1, right = 1 },
    }

    local macro_recording = {
      function()
        local reg = vim.fn.reg_recording()
        if reg == "" then
          return ""
        end
        return " @" .. reg
      end,
      color = { fg = "#f38ba8" },
      padding = { left = 1, right = 1 },
    }

    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = false,
        icons_enabled = true,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 5,
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
            'RecordingEnter',
            'RecordingLeave',
          },
        },
      },

      sections = {
        lualine_a = { "progress" },
        lualine_b = { "branch", macro_recording },
        lualine_c = { filename_component },
        lualine_x = { "diff" },
        lualine_y = { battery_component },
        lualine_z = { date },
      },

      -- inactive_sections = {
      --   lualine_a = { "mode" },
      --   lualine_b = {},
      --   lualine_x = {},
      --   lualine_c = {},
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
    })
  end,
}
