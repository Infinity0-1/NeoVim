return {
  "preservim/vim-textobj-quote",
  dependencies = { "kana/vim-textobj-user" },
  ft = { "markdown", "text", "latex" },
  config = function()
    vim.fn["textobj#quote#init"]()
  end,
}
