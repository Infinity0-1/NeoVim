
vim.api.nvim_set_keymap('n', 'Ff', [[:w<CR>:call system('Pdf- ' . shellescape(expand('%:p')))<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'FF', [[:w<CR>:call system('Pdf+ ' . shellescape(expand('%:p')))<CR>]], {noremap = true, silent = true})

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
