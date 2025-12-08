vim.opt.shell = "/usr/bin/zsh"
vim.opt.shellcmdflag = "-ic"
vim.opt.cmdheight = 0

vim.opt.clipboard = "unnamedplus"

vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

vim.opt.list = true
vim.opt.listchars = {trail = '-',}
-- vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "105"
-- vim.opt.foldcolumn = "1"

vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

local undo_dir = vim.fn.stdpath('cache') .. '/undo'
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end

vim.opt.undodir = undo_dir
vim.opt.undofile = true

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

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'Ff', [[:w<CR>:call system('Pdf- ' . shellescape(expand('%:p')))<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'FF', [[:w<CR>:call system('Pdf+ ' . shellescape(expand('%:p')))<CR>]], {noremap = true, silent = true})

vim.api.nvim_create_user_command("Q", function()
    if vim.bo.modified then
        vim.cmd("q!")
    else
        vim.cmd("q")
    end
end, {})

vim.cmd("cnoreabbrev q Q")

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    if vim.bo.filetype ~= 'commit' then
      vim.schedule(function()
        local line = vim.fn.line("'\"")
        if line >= 1 and line <= vim.fn.line("$") then
          vim.cmd([[normal! g`"]])
        end
      end)
    end
  end,
})

vim.api.nvim_set_keymap('n', '<leader>r', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>R',
     "<cmd>CompilerStop<cr>"
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

local modes = { "n", "i", "v", "t", "x", "s", "o" }
for _, mode in ipairs(modes) do
  pcall(vim.keymap.del, mode, "<C-h>")
  pcall(vim.keymap.del, mode, "<C-j>")
  pcall(vim.keymap.del, mode, "<C-k>")
  pcall(vim.keymap.del, mode, "<C-l>")
end

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
