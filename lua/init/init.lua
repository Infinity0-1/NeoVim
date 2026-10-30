vim.g.maplocalleader = "\\"
vim.g.mapleader = " "

vim.opt.shell = "/usr/bin/zsh"
vim.opt.shellcmdflag = "-ic"
vim.opt.cmdheight = 1

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

local undo_dir = vim.fn.stdpath('cache') .. '/undo'
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#292929" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d0d0d0", bold = true })
  end,
})

vim.opt.undodir = undo_dir
vim.opt.undofile = true

vim.opt.cursorline = true
vim.opt.guicursor = "n-v-c:block,i:block-blinkoff1-blinkon1"
vim.opt.signcolumn = "yes:1"

vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

vim.opt.scrolloff = 2
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = false
vim.opt.shiftwidth = 4

vim.opt.smartindent = false
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.list = false
vim.opt.spell = false
vim.opt.listchars = {trail = '-',}
vim.opt.spelllang = { "en_us" }
 
require("vim._core.ui2").enable({
  enable = true,
  msg = {
    target = "cmd",
    msg = { timeout = 600 },
  },
})
