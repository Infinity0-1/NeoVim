return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    ts.install({
      "lua", "vim", "vimdoc", "query",
      "bash", "python", "c", "cpp", "rust",
      "latex", "bibtex", "markdown", "markdown_inline",
      "json", "yaml", "toml", "html", "css", "javascript",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
