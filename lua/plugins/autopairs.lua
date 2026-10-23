return {
  "windwp/nvim-autopairs",
  lazy = true,
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$%]%}%)]]=],
    })
  end,
}
