return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[  ██╗███╗   ██╗███████╗██╗███╗   ██╗██╗████████╗██╗   ██╗ ]],
      [[  ██║████╗  ██║██╔════╝██║████╗  ██║██║╚══██╔══╝╚██╗ ██╔╝ ]],
      [[  ██║██╔██╗ ██║█████╗  ██║██╔██╗ ██║██║   ██║    ╚████╔╝  ]],
      [[  ██║██║╚██╗██║██╔══╝  ██║██║╚██╗██║██║   ██║     ╚██╔╝   ]],
      [[  ██║██║ ╚████║██║     ██║██║ ╚████║██║   ██║      ██║    ]],
      [[  ╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝      ╚═╝    ]],
      [[                                                          ]],
      [[                      I N F I N I T Y                     ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰍉  Find file", ":lua require('fzf-lua').files() <CR>"),
      dashboard.button("r", "󰯂  Recent files", ":lua require('fzf-lua').oldfiles() <CR>"),
      dashboard.button("p", "  Plugins", ":Lazy<CR>"),
      dashboard.button("m", "  Mason", ":Mason<CR>"),
      dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
    }

    dashboard.section.footer.val = function()
      return vim.g.startup_time_ms or "Abdelkader"
    end
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

  end,
}
