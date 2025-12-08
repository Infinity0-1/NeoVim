return {
  {
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "OverseerOpen", "OverseerToggle", "OverseerRun" },

    opts = {
      task_list = {
        direction = "bottom",
        min_height = 12,
        max_height = 12,
        default_detail = 1,
      },

      strategy = {
        "terminal",
        direction = "horizontal",
      },

      open_on_start = true,
    },
  },
}
