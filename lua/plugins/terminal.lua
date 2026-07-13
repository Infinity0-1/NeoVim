return {
  "akinsho/toggleterm.nvim",
  even = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]],
      direction = "float",
      terminal_mappings = true,
      start_in_insert = true,
      insert_mappings = true,
      close_on_exit = true,
      persist_size = true,
      persist_mode = true,
      hide_numbers = true,
      auto_scroll = true,
      float_opts = {
        border = "rounded",

        width = function()
          return math.floor(vim.o.columns * 0.88)
        end,

        height = function()
          return math.floor(vim.o.lines * 0.88)
        end,

        col = function()
          return math.floor(vim.o.columns * 0.06)
        end,

        row = function()
          return math.floor(vim.o.lines * 0.03)
        end,
      },

      winbar = {
        enabled = false,
      },
    })
  end,
}
