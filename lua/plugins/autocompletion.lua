return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
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

    window = {
      completion = {
        border = "rounded",
        max_width = 50,
        max_height = 24,
      },

      documentation = {
        border = "rounded",
        max_width = 91,
        max_height = 51,
      },
    },

    performance = { max_view_entries = 24 },

    mapping = cmp.mapping.preset.insert({
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-b>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
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

  cmp.setup.cmdline("/", {
    completion = { autocomplete = false },
    mapping = cmp.mapping.preset.cmdline({
      ["<C-Space>"] = {
        c = function()
          if cmp.visible() then cmp.close() else cmp.complete() end
        end,
      },
    }),

    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    completion = { autocomplete = false },
    mapping = cmp.mapping.preset.cmdline({
      ["<C-Space>"] = {
        c = function()
          if cmp.visible() then cmp.close() else cmp.complete() end
        end,
      },
    }),

    sources = cmp.config.sources({
      { name = "path" },
    }, {
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man", "!" },
        },
      },
    }),
  })
  end,
}
