vim.api.nvim_set_keymap('n', '<leader>r', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>R',
     "<cmd>CompilerStop<cr>"
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<N>", ":new<CR>", { noremap = true, silent = true })

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
