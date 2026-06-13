
require('blink.cmp').setup({
  keymap = {
    preset = 'default',
    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<S-k>"] = { "scroll_documentation_up", "fallback" },
    ["<S-j>"] = { "scroll_documentation_down", "fallback" },
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
  },

  appearance = {
    nerd_font_variant = 'mono',
  },

  cmdline = {
    enabled = true,
  },

  completion = {
    documentation = {
      auto_show = true,
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    providers = {
      lsp = {
        name = "lsp",
        enabled = true,
        module = "blink.cmp.sources.lsp",
        min_keyword_length = 0,
        score_offset = 90,
      },

      path = {
        name = "Path",
        module = "blink.cmp.sources.path",
        score_offset = 25,
        fallbacks = { "snippets", "buffer" },
        opts = {
          trailing_slash = false,
          label_trailing_slash = true,
          get_cwd = function(context)
            return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
          end,
          show_hidden_files_by_default = true,
        },
      },
    },
  },

  fuzzy = {
    implementation = "prefer_rust_with_warning"
  }
})
