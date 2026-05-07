return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  config = function()
    require("notify").setup({
      background_colour = "#000000",
      fps = 120,
      render = "minimal",
      stages = "static",
      timeout = 1500,
    })

    vim.notify = require("notify")
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline",
        -- view = "cmdline_popup",
      },

      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },

        progress = {
          enabled = true,
          throttle = 1500,
          view = "mini",
        },
      },

      messages = {
        enabled = true,
        view = "mini",
      },

      popupmenu = {
        enabled = true,
        backend = "cmp",
      },

      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },

      notify = {
        enabled = true,
      },

      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
            -- row = "30%",
            -- col = "50%",
          },
        },
      },
    })
  end,
}
