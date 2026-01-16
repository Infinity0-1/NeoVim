vim.opt.shell = "/usr/bin/zsh"
vim.opt.shellcmdflag = "-ic"
vim.opt.cmdheight = 0

vim.opt.clipboard = "unnamedplus"

vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = " ↳ "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

vim.opt.list = true
vim.opt.listchars = {trail = '-',}

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

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", "gvo<Esc>")
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "X", '"_X')
vim.keymap.set({ "n", "x" }, "c", '"_c')
vim.keymap.set({ "n", "x" }, "C", '"_C')
vim.keymap.set("n", "dd", function()
  if vim.api.nvim_get_current_line() == "" then
    vim.cmd('normal! "_dd')
  else
    vim.cmd('normal! dd')
  end
end, { silent = true })

vim.api.nvim_set_keymap('n', 'Ff', [[:w<CR>:call system('Pdf- ' . shellescape(expand('%:p')))<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'FF', [[:w<CR>:call system('Pdf+ ' . shellescape(expand('%:p')))<CR>]], {noremap = true, silent = true})
vim.keymap.set("n", "<leader>PP", function()
  vim.cmd("w")
  local file = vim.fn.expand("%")
  vim.cmd("!" .. "manim -pqh " .. file)
end, { desc = "Save and run manim on current file" })
vim.keymap.set("n", "<leader>Pp", function()
  vim.cmd("w")
  local file = vim.fn.expand("%")
  vim.cmd("!" .. "manim -pqh " .. file)
end, { desc = "Save and run manim on current file" })
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
