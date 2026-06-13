
vim.g.mapleader = " "
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_man_plugin = 1

vim.opt.shell = "/usr/bin/zsh"
vim.opt.shellcmdflag = "-ic"
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.wrap = false
vim.opt.breakindent = false
vim.opt.linebreak = true
vim.opt.showbreak = " ——>"
vim.opt.writebackup = false
vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.spell = false
vim.opt.spelllang = { "en_us" }
vim.opt.listchars = {trail = '—',}

vim.cmd[[highlight Normal guibg=none ctermbg=none]]

vim.api.nvim_set_hl(0, "SpellBad",         { undercurl = true, sp = "#cc8080", bg = "NONE", })
vim.api.nvim_set_hl(0, "DiagnosticError",  { fg = "NONE", bg = "NONE", })
vim.api.nvim_set_hl(0, "DiagnosticWarn",   { fg = "NONE", bg = "NONE", })
vim.api.nvim_set_hl(0, "ErrorMsg",         { fg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "WarningMsg",       { fg = "NONE", bg = "NONE", })
vim.api.nvim_set_hl(0, "NotifyERRORBody",  { fg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "MsgArea",          { bg = "NONE" })
vim.api.nvim_set_hl(0, "MsgSeparator",     { bg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#777777" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

local undo_dir = vim.fn.stdpath('cache') .. '/undo'
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end
vim.opt.undodir = undo_dir
vim.opt.undofile = true

local last_file = nil
vim.keymap.set("n", "<leader>e", function()
  local current = vim.bo.filetype
  if current == "netrw" then
    if last_file and vim.api.nvim_buf_is_valid(last_file) then
        vim.api.nvim_set_current_buf(last_file)
    end
  else
    last_file = vim.api.nvim_get_current_buf()
    vim.cmd("Ex")
  end
end)

local manim_term
vim.keymap.set("n", "<leader>PP", function()
  vim.cmd("w")
  local file = vim.fn.expand("%")
  if not manim_term or not vim.api.nvim_buf_is_valid(manim_term) then
    vim.cmd("botright split")
    vim.cmd("resize 16")
    vim.cmd("terminal")
    manim_term = vim.api.nvim_get_current_buf()
  end
  vim.fn.chansend(vim.b.terminal_job_id, "manim -pqh " .. file .. "\n")
  vim.cmd("wincmd p")
end)

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "text" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})
