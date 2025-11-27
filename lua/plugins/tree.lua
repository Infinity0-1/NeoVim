return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "NvimTreeToggle",
  keys = {
    { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
  },
  config = function()
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      sort_by = "name",
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
      view = {
        width = 18,
        side = "left",
        adaptive_size = false,
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
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
    })
  end,
}
