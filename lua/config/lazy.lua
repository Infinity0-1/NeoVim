vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.termguicolors = true

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

vim.cmd("colorscheme cyberdream")
