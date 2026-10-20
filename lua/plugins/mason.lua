return {
  {
    "mason-org/mason.nvim",
    lazy = true,
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "~",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    enabled = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({ "c", "cpp", "lua" })
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },

    opts = {
      ensure_installed = { "clangd" },
      automatic_enable = true,
    },
  },
}
