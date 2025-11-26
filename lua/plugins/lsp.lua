return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
    local notify = vim.notify
    vim.notify = function(msg, ...)
        if msg:match("lspconfig") then
            return
        end
        notify(msg, ...)
    end
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_lsp = require("mason-lspconfig")
      mason.setup()
      mason_lsp.setup({
        ensure_installed = { "clangd", "pyright", "texlab" },
        automatic_installation = true,
      })
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({})
      lspconfig.texlab.setup({
        settings = {
          texlab = {
            build = { executable = "latexmk", args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" }, onSave = true },
            chktex = { onEdit = true, onOpenAndSave = true },
          }
        }
      })
    end,
  }
}
