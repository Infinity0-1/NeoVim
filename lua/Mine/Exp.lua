vim.keymap.set("n", "dd", function()
  if vim.api.nvim_get_current_line() == "" then
    vim.cmd('normal! "_dd')
  else
    vim.cmd('normal! dd')
  end
end, { silent = true })
