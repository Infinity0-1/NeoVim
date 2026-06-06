
local undo_dir = vim.fn.stdpath('cache') .. '/undo'
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end
vim.opt.undodir = undo_dir
vim.opt.undofile = true

vim.cmd[[ highlight Normal guibg=none ctermbg=none ]]

vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#777777" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SpellBad",         { undercurl = true, sp = "#cc8080", bg = "NONE", })
vim.api.nvim_set_hl(0, "DiagnosticError",  { fg = "#dd8080", bg = "NONE", })
vim.api.nvim_set_hl(0, "DiagnosticWarn",   { fg = "#ffcc80", bg = "NONE", })
vim.api.nvim_set_hl(0, "ErrorMsg",         { fg = "#cc8080", bg = "NONE" })
vim.api.nvim_set_hl(0, "WarningMsg",       { fg = "#ffb6a0", bg = "NONE", })
vim.api.nvim_set_hl(0, "MsgArea",          { bg = "NONE" })
vim.api.nvim_set_hl(0, "MsgSeparator",     { bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyERRORBody",  { fg = "#cc8080", bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#cc8080", bg = "NONE" })
vim.api.nvim_set_hl(0, "MatchParen",       { bg = "NONE", fg = "NONE", underline = true, })
vim.api.nvim_set_hl(0, "NormalFloat",      { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder",      { bg = "NONE" })
