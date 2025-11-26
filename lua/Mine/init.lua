vim.opt.shell = "/usr/bin/zsh"
vim.opt.shellcmdflag = "-ic"
vim.opt.cmdheight = 0

vim.opt.clipboard = "unnamedplus"

vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "

vim.opt.number = true
vim.opt.numberwidth = 1

vim.opt.list = true
vim.opt.listchars = {trail = '-',}
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "110"
vim.opt.foldcolumn = "1"

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

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })



-- vim.api.nvim_create_user_command("PdfMinus", function()
--   local filename = vim.fn.expand("%:p")
--   vim.cmd("write")
--   vim.cmd("!" .. "Pdf- " .. vim.fn.shellescape(filename))
-- end, {})
-- vim.keymap.set("n", "<leader>P", ":PdfMinus<CR>", { desc = "Fast Compile" })
--
-- vim.api.nvim_create_user_command("PdfPlus", function()
--   local filename = vim.fn.expand("%:p")
--   vim.cmd("write")
--   vim.cmd("!" .. "Pdf+ " .. vim.fn.shellescape(filename))
-- end, {})
-- vim.keymap.set("n", "<leader>F", ":PdfPlus<CR>", { desc = "Full Compile" })
--
-- vim.api.nvim_create_user_command("ManimRun", function()
--   local file = vim.fn.expand("%:p")
--   local dir = vim.fn.fnamemodify(file, ":h")
--   local base = vim.fn.fnamemodify(file, ":t:r")
--   vim.cmd("write")
--   vim.cmd("botright split new | resize 15")
--   local term_buf = vim.api.nvim_get_current_buf()
--   local cmd = string.format("cd %s && manim -pqh %s.py %s", vim.fn.shellescape(dir), base, base)
--   vim.fn.termopen(cmd, {
--     on_exit = function(_, code)
--       if code == 0 then
--         print("Manim finished successfully!")
--       else
--         print("Manim exited with errors.")
--       end
--     end,
--   })
-- end, {})
-- vim.keymap.set("n", "<leader>M", ":ManimRun<CR>", { desc = "Compile Manim Scene" })
