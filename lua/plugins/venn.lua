return {
  {
    "jbyuki/venn.nvim",
    cmd = { "VBox", "ToggleVenn" },
    config = function()
      vim.api.nvim_set_keymap(
        "n", "<leader>v", ":ToggleVenn<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
