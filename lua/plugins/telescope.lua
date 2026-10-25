return {
  {
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
      vim.keymap.set("n", "<leader>t", ":Telescope<CR>", { silent = true })
      vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { silent = true })
      vim.keymap.set("n", "<leader>S", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })
      vim.keymap.set("n", "<leader>s", ":Telescope live_grep<CR>", { silent = true })
      vim.keymap.set("n", "<leader>k", ":Telescope resume<CR>", { silent = true })
      vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { silent = true })
      vim.keymap.set("n", "<leader>r", ":Telescope oldfiles<CR>", { silent = true })

      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          sorting_strategy = "descending",
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "bottom",
            preview_width = 0.5,
            preview_cutoff = 1,
            width = 0.92,
            height = 0.95,
          },

          preview = {
            treesitter = true,
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
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      pcall(telescope.load_extension, "fzf")
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>h", function()
        builtin.find_files({
          hidden = true,
          find_command = (vim.fn.executable("fd") == 1)
            and { "fd", "--type", "f", "-u", "--strip-cwd-prefix" }
            or nil,
        })

      end, { desc = "Find hidden files" })
    end,
  },

  {
    "jiaoshijie/undotree",
    opts = {},
    keys = {
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  }
}
