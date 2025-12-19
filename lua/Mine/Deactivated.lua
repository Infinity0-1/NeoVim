-- For the end of the coder vertical line:

-- vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "105"
-- vim.opt.foldcolumn = "1"

-- For the visual vs actual line skip.

-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     vim.keymap.set({'n','v','o'}, 'j', 'gj', { buffer = true, noremap = true, silent = true })
--     vim.keymap.set({'n','v','o'}, 'k', 'gk', { buffer = true, noremap = true, silent = true })
--   end,
-- })

-- For removing (not really) existing binds:

-- local modes = { "n", "i", "v", "t", "x", "s", "o" }
-- for _, mode in ipairs(modes) do
--   pcall(vim.keymap.del, mode, "<C-h>")
--   pcall(vim.keymap.del, mode, "<C-j>")
--   pcall(vim.keymap.del, mode, "<C-k>")
--   pcall(vim.keymap.del, mode, "<C-l>")
-- end
