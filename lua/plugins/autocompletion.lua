return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" },
    },

    "onsails/lspkind.nvim",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0
        and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      performance = {
        max_view_entries = 4,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered({
          border = { "│", "─", "╮", "│", "╯", "─", "│", "│" },
        }),
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif has_words_before() then
            cmp.complete()
            vim.defer_fn(function()
              if cmp.visible() then
                cmp.confirm({ select = true })
              end
            end, 50)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-Space>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end, { "i", "c" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "path" },
        { name = "buffer", keyword_length = 3 },
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          menu = {
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
          },
        }),
      },

      experimental = { ghost_text = true },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })

  end,
}
