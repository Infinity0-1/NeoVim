local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--   local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
--   if vim.v.shell_error ~= 0 then
--     vim.api.nvim_echo({
--       { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--       { out, "WarningMsg" },
--       { "\nPress any key to exit..." },
--     }, true, {})
--     vim.fn.getchar()
--     os.exit(1)
--   end
-- end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

vim.cmd[[highlight Normal guibg=none ctermbg=none]]

vim.o.completeopt = "menu,menuone,popup"
vim.o.winborder = "single"

vim.api.nvim_set_hl(0, "DiagnosticError",  { fg = "NONE", bg = "NONE", })
vim.api.nvim_set_hl(0, "DiagnosticWarn",   { fg = "NONE", bg = "NONE", })
vim.api.nvim_set_hl(0, "ErrorMsg",         { fg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "WarningMsg",       { fg = "NONE", bg = "NONE", })
vim.api.nvim_set_hl(0, "NotifyERRORBody",  { fg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "MsgArea",          { bg = "NONE" })
vim.api.nvim_set_hl(0, "MsgSeparator",     { bg = "NONE" })

vim.api.nvim_set_hl(0, "Pmenu",       { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "PmenuSel",    { bg = "#3a3a3a", bold = true })
vim.api.nvim_set_hl(0, "PmenuSbar",   { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "PmenuThumb",  { bg = "#c0c0c0" })
vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#c0c0c0", bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#c0c0c0", bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "SpellBad",    { undercurl = true, sp = "#cc8080", bg = "NONE" })
