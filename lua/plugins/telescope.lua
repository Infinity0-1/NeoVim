return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "bottom" },
      },
      pickers = {
        find_files = {
          find_command = (vim.fn.executable("fd") == 1)
              and { "fd", "--type", "f", "--strip-cwd-prefix" }
              or nil,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    pcall(telescope.load_extension, "fzf")
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>fF", function()
      builtin.find_files({
        hidden = true,
        find_command = (vim.fn.executable("fd") == 1)
            and { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" }
            or nil,
      })
    end, { desc = "Find hidden files" })

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help tags" })
    vim.keymap.set("n", "<leader>fr", builtin.resume,     { desc = "Resume last search" })
  end,
}
