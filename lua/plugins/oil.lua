return {
  'stevearc/oil.nvim',
  event = "VeryLazy",
  init = function()
    function _G.get_oil_winbar()
      local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
      local name = vim.api.nvim_buf_get_name(bufnr)
      local path = name:gsub("^oil[^:]*://", "")
      if path == "" then path = vim.fn.getcwd() end
      path = vim.fn.fnamemodify(path, ":p")
      return (path:gsub("%%", "%%%%"))
    end
  end,

  opts = {
    watch_for_changes = true,
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
    win_options = {
      winbar = "%!v:lua.get_oil_winbar()",
    },

    columns = {
      { "permissions", highlight = "Special" },
      { "mtime", format = "%b %d %H:%M", highlight = "Comment" },
      { "size", highlight = "Number" },
    },

    view_options = { show_hidden = false, },
  },

  keys = { { "_", "<cmd>Oil<CR>", silent = true, desc = "Open Oil tree manager" } },
}
