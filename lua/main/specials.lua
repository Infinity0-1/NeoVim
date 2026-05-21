
local undo_dir = vim.fn.stdpath('cache') .. '/undo'

if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end

vim.opt.undodir = undo_dir
vim.opt.undofile = true

vim.cmd("colorscheme catppuccin")
vim.cmd[[ highlight Normal guibg=none ctermbg=none ]]

vim.api.nvim_set_hl(0, "SpellBad",         { undercurl = true, sp = "#ff8080", bg = "NONE", })
vim.api.nvim_set_hl(0, "DiagnosticError",  { fg = "#ff8080", bg = "NONE", })
vim.api.nvim_set_hl(0, "DiagnosticWarn",   { fg = "#ffcc80", bg = "NONE", })
vim.api.nvim_set_hl(0, "ErrorMsg",         { fg = "#ff8080", bg = "NONE" })
vim.api.nvim_set_hl(0, "WarningMsg",       { fg = "#ffb380", bg = "NONE", })
vim.api.nvim_set_hl(0, "MsgArea",          { bg = "NONE" })
vim.api.nvim_set_hl(0, "MsgSeparator",     { bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyERRORBody",  { fg = "#ff8080", bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#ff8080", bg = "NONE" })

-- vim.api.nvim_set_hl(0, "MatchParen",       { bg = "NONE", fg = "NONE", underline = true, })
-- vim.api.nvim_set_hl(0, "NormalFloat",      { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "FloatBorder",      { bg = "NONE" })
