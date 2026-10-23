vim.keymap.set("n", "<C-Q>", ":%bdelete! | restart<CR>", { silent = true })
vim.keymap.set("n", "Q", ":bdelete!<CR>", { silent = true })

vim.keymap.set("t", "<C-Tab>", [[<C-\><C-n><C-Tab>]], { silent = true, remap = true })
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>:]], { silent = true })
vim.keymap.set("n", "<C-t>", ":terminal<CR>i", { silent = true })

vim.keymap.set("n", "<C-Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<C-S-Tab>", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<C-/>", ":nohlsearch<CR>", { silent = true })

vim.keymap.set("n", "<C-;>", ":!")
vim.keymap.set("v", "<C-;>", ":!")

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })

vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", "Y", "\"+y", { silent = true })

vim.keymap.set("v", "<C-p>", "\"+p", { silent = true })
vim.keymap.set("v", "<leader>p", "\"_dp", { silent = true })
vim.keymap.set("v", "<leader>P", "\"_d\"+p", { silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions() end, { silent = true })
