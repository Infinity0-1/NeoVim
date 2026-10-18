return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
  },
  
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    performance = { max_view_entries = 10 },

    window = {
      completion = {
        border = "rounded",
        max_width = 9,
        max_height = 9,
      },

      documentation = {
        border = "rounded",
        max_width = 50,
        max_height = 10,
      },
    },

    mapping = cmp.mapping.preset.insert({
      [ "<Tab>" ] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      [ "<C-n>" ] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      [ "<C-b>" ] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

      ["<C-Space>"] = cmp.mapping(function()
        if cmp.visible() then cmp.close() else cmp.complete() end
      end, { "i", "c" }),
    }),

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
    }),
  })
  end,
}
