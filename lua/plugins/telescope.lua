return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  priority = 999,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "nvim-mini/mini.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
  },

  config = function()
    vim.keymap.set("n", "<leader>ff", ":Telescope<CR>", { silent = true }, { desc = "Telescope functions"})
    vim.keymap.set("n", "ff", ":Telescope fd<CR>", { silent = true })
    vim.keymap.set("n", "fs", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })
    vim.keymap.set("n", "fS", ":Telescope live_grep<CR>", { silent = true })
    vim.keymap.set("n", "fk", ":Telescope resume<CR>", { silent = true })
    vim.keymap.set("n", "fd", ":Telescope buffers<CR>", { silent = true })
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "bottom",
          preview_width = 0.5,
          width = 0.9,
          height = 0.9,
        },

        preview = {
          treesitter = false,
        },
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
          fuzzy = false,
          override_generic_sorter = false,
          override_file_sorter = false,
          case_mode = "smart_case",
        },
      },
    })

    pcall(telescope.load_extension, "fzf")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "fh", function()
      builtin.find_files({
        hidden = true,
        find_command = (vim.fn.executable("fd") == 1)
            and { "fd", "--type", "f", "-u", "--strip-cwd-prefix" }
            or nil,
      })

    end, { desc = "Find hidden files" })
  end,
}
