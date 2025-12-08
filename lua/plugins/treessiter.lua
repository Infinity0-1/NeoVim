return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufRead",
  dependencies = { "nvim-treesitter/playground" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "cpp", "lua", "python", "bash", "json", "yaml" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = false,
      },
    })
  end,
}
