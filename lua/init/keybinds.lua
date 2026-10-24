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

local function buf_dir()
  if vim.bo.filetype == "oil" then
    local ok, oil = pcall(require, "oil")
    local dir = ok and oil.get_current_dir()
    if dir then return dir end
  end
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" or name:match("^%w[%w+.-]*://") then
    return vim.fn.getcwd()
  end
  return vim.fn.expand("%:p:h")
end

vim.api.nvim_create_user_command("E", function(opts)
  local path = vim.fs.joinpath(buf_dir(), opts.args)
  vim.cmd.edit(vim.fn.fnameescape(path))
end, {
  nargs = 1,
  complete = function(arglead)
    local dir = buf_dir():gsub("/$", "")
    local items = vim.fn.getcompletion(dir .. "/" .. arglead, "file")
    return vim.tbl_map(function(p) return p:sub(#dir + 2) end, items)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
    local data = event.data
    if not data or data.err then return end
    for _, action in ipairs(data.actions or {}) do
      if action.type == "delete" and action.url:find("^oil://") then
        local path = action.url:gsub("^oil://", "")
        local is_dir = vim.endswith(path, "/")
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          local name = vim.api.nvim_buf_get_name(buf)
          local matches = is_dir and vim.startswith(name, path) or name == path
          if matches and vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end
      end
    end
  end,
})
