vim.opt.shell = "/usr/bin/zsh"
vim.opt.shellcmdflag = "-ic"
vim.opt.clipboard = "unnamedplus"
vim.opt.spelllang = "en_us"
vim.opt.showbreak = "↳ "
vim.opt.signcolumn = "yes"
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "110"
vim.opt.foldcolumn = "1"
vim.opt.spell = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.undodir = undo_dir
vim.opt.undofile = true

local undo_dir = vim.fn.stdpath('cache') .. '/undo'
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end

vim.cmd([[set sidescrolloff=8]])
vim.cmd([[highlight SpellBad cterm=underline ctermfg=Red gui=underline guifg=Red]])
vim.cmd [[
  highlight Normal guibg=none ctermbg=none
  highlight NonText guibg=none ctermbg=none
  highlight NormalFloat guibg=none ctermbg=none
  highlight FloatBorder guibg=none ctermbg=none
  highlight Pmenu guibg=none ctermbg=none
]]

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.keymap.set({'n','v','o'}, 'j', 'gj', { buffer = true, noremap = true, silent = true })
    vim.keymap.set({'n','v','o'}, 'k', 'gk', { buffer = true, noremap = true, silent = true })
  end,
})

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
