return {
  "lervag/vimtex",
  enabled = true,
  ft = { "tex" },
  init = function()
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      hooks = {},
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    vim.keymap.set("n", "FF", ":w | LspTexlabBuild<CR>", { silent = true }, { desc = "Compiling" })
    vim.keymap.set("n", "FK", ":LspTexlabCleanArtifacts<CR>", { silent = true }, { desc = "Cleaning files" })
    vim.keymap.set("n", "<leader>t", ":VimtexTocOpen<CR>", { silent = true }, { desc = "Talbe of Content" })
    vim.keymap.set("n", "<leader>v", ":VimtexView<CR>", { silent = true }, { desc = "Viewing PDF" })

    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 1
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_ignore_filters = {}
    vim.g.vimtex_syntax_enabled = 0
    vim.g.vimtex_syntax_conceal_enable = 0
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      cites = 1,
      fancy = 1,
      greek = 1,
      math_bounds = 1,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      styles = 1,
    }

    vim.g.vimtex_complete_enabled = 0
    vim.g.vimtex_complete_close_braces = 0
    vim.g.vimtex_complete_ignore_case = 0
    vim.g.vimtex_fold_enabled = 0
    vim.g.vimtex_indent_enabled = 0
    vim.g.vimtex_toc_enabled = 1
    vim.g.vimtex_toc_config = {
      show_help = 0,
      split_pos = "vert leftabove",
      split_width = 50,
    }

    vim.g.vimtex_mappings_enabled = 1
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_parser_enabled = 0
    vim.g.vimtex_matchparen_enabled = 1
    vim.g.vimtex_text_obj_enabled = 0
    vim.g.vimtex_format_enabled = 0
    vim.g.vimtex_doc_enabled = 1
  end,
}
