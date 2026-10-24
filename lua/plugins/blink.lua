local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "saghen/blink.cmp",
  version = "1.*",
  lazy = false,
  dependencies = { "rafamadriz/friendly-snippets" },
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",

      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "select_prev", "fallback" },
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.accept()
          end
        end,
        "snippet_forward",
        function(cmp)
          if has_words_before() then
            cmp.show()
            vim.defer_fn(function()
              if cmp.is_visible() then
                cmp.accept()
              end
            end, 50)
            return true
          end
        end,
        "fallback",
      },

      ["<C-Space>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.hide()
          end
          return cmp.show()
        end,
      },
    },

    appearance = { nerd_font_variant = "mono" },
    completion = {
      ghost_text = { enabled = true },
      menu = {
        border = "single",
        max_height = 6,
        draw = {
          columns = {
            { "kind_icon", "label", gap = 1 },
            { "kind" },
            { "source_name" },
          },

          components = {
            label = { width = { fill = true, max = 50 } },
            source_name = {
              text = function(ctx)
                return "[" .. ctx.source_name .. "]"
              end,
            },
          },
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = { "│", "─", "╮", "│", "╯", "─", "│", "│" },
        },
      },
    },

    sources = {
      default = { "path", "lsp", "snippets", "buffer" },
      providers = {
        path = { name = "Path", score_offset = 100 },
        lsp = { name = "LSP", score_offset = 90 },
        snippets = { name = "Snip" },
        buffer = { name = "Buf", min_keyword_length = 3 },
      },
    },

    signature = { enabled = true, window = { border = "single" } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
