return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  cmd = "NvimTreeToggle",
  keys = { { "<leader>E", ":NvimTreeToggle<CR>", desc = "Toggle File Explorer" }, },
  config = function()
    require("nvim-tree").setup({
      disable_netrw = false,
      hijack_netrw = false,
      sort_by = "name",
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },

      view = {
        width = 40,
        side = "right",
        adaptive_size = true,
      },

      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },

      filters = {
        dotfiles = true,
      },

      git = {
        enable = true,
        ignore = true,
      },
    })
  end,
}
