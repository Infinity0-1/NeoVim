
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

vim.cmd.colorscheme("nightfox")
