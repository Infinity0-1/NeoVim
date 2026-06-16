vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.opt.shell = "/usr/bin/zsh"
vim.opt.shellcmdflag = "-ic"
vim.opt.guicursor = "a:block"
vim.opt.guicursor = "i:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.wrap = false
vim.opt.breakindent = false
vim.opt.linebreak = true
vim.opt.showbreak = "——> "
vim.opt.backup = false
vim.opt.swapfile = true
vim.opt.smartindent = true
vim.opt.writebackup = false
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.list = false
vim.opt.spell = false
vim.opt.spelllang = { "en_us" }
vim.opt.listchars = {trail = '@',}
vim.g.maplocalleader = "\\"
vim.g.mapleader = " "

local undo_dir = vim.fn.stdpath('cache') .. '/undo'

if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end
vim.opt.undodir = undo_dir
vim.opt.undofile = true

require('vim._core.ui2').enable()

vim.api.nvim_create_autocmd("InsertCharPre", {
  pattern = { "*.md", "*.txt", "*.tex" },
  callback = function()
    local c = vim.v.char
    if c == '"' then
      local col = vim.fn.col('.') - 1
      local line = vim.fn.getline('.')
      local before = line:sub(1, col)
      if col == 0 or before:match("[%s%(%[{]$") then
        vim.v.char = "“"
      else
        vim.v.char = "”"
      end
    elseif c == "'" then
      local col = vim.fn.col('.') - 1
      local line = vim.fn.getline('.')
      local before = line:sub(1, col)
      if col == 0 or before:match("[%s%(%[{]$") then
        vim.v.char = "‘"
      else
        vim.v.char = "’"
      end
    end
  end,
})
