return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },

            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("texlab", {
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              onSave = false,
            },

            chktex = { onOpenAndSave = false },
          },
        },
      })

      local function root_or_cwd(markers)
        return function(bufnr, on_dir)
          on_dir(vim.fs.root(bufnr, markers) or vim.fn.getcwd())
        end
      end

      vim.lsp.config("lua_ls", {
        root_dir = root_or_cwd({ ".luarc.json", ".luarc.jsonc", ".stylua.toml", "stylua.toml", ".git" }),
      })

      vim.lsp.config("texlab", {
        root_dir = root_or_cwd({ ".latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml", ".git" }),
      })

      vim.lsp.config("pyright", {
        root_dir = root_or_cwd({ "pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }),
      })

      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--header-insertion=never", "--completion-style=detailed" },
        root_dir = root_or_cwd({ "compile_commands.json", "compile_flags.txt", ".clangd", ".git" }),
      })

      vim.lsp.config("bashls", {
        root_dir = root_or_cwd({ ".git" }),
      })

      vim.lsp.enable({ "lua_ls", "texlab", "pyright", "clangd", "rust_analyzer", "bashls" })

      local diagnostics_visible = false
      local function apply_diagnostics()
        vim.diagnostic.config({
          virtual_text = diagnostics_visible,
          signs = diagnostics_visible,
          underline = diagnostics_visible,
          update_in_insert = false,
          severity_sort = true,
        })
      end
      apply_diagnostics()

      vim.keymap.set("n", "<leader>d", function()
        diagnostics_visible = not diagnostics_visible
        apply_diagnostics()
        vim.notify("Diagnostics " .. (diagnostics_visible and "shown" or "hidden"))
      end, { desc = "Toggle diagnostics display" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = args.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "go to definition")
          map("gD", vim.lsp.buf.declaration, "go to declaration")
          map("<leader>e", vim.diagnostic.open_float, "show diagnostic")
          map("<leader>F", function() vim.lsp.buf.format({ async = true }) end, "format")
        end,
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
      },

      "saadparwaiz1/cmp_luasnip",
    },

    config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    cmp.setup({
      completion = { completeopt = "menu,menuone,noinsert" },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      }, {
        { name = "buffer", keyword_length = 3 },
      }),

      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)
          item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            path = "[Path]",
            buffer = "[Buf]",
          })[entry.source.name]
          return item
        end,
      },

      experimental = { ghost_text = true },
    })
    end,
  },
}
