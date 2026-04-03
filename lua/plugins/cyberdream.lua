return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
  require("cyberdream").setup({
     variant = "auto",
     transparent = true,
     saturation = 0.2,
     italic_comments = true,
     hide_fillchars = true,
     borderless_pickers = false,
     terminal_colors = false,
     highlights = {
         Comment = { fg = "#888888", italic = true },
         String = { fg = "#00ffcc" },
     },
     overrides = function(colors)
         return {
             ["@function"] = { fg = colors.cyan, italic = true },
             ["@property"] = { fg = colors.magenta, bold = true },
             ["@variable"] = { fg = colors.green },
         }
     end,
     colors = {
         bg = "#000000",
         green = "#00ff00",
         dark = { magenta = "#f0b000", fg = "#ffffff", cyan = "#00ffff" },
         light = { red = "#ff5c57", cyan = "#5ef1ff" },
     },
     extensions = { telescope = false, notify = true, mini = true },
  })
  end,
}
