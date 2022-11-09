vim.opt.list = true
-- vim.wo.colorcolumn = "99999"
-- vim.opt.termguicolors = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_indent_level = 2
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
  -- "coc-explorer",
  "help",
  "dashboard",
  "floaterm",
  "packer",
  "html",
  ""
}
vim.g.indent_blankline_context_patterns = {
  "class",
  "return",
  "function",
  "method",
  "^if",
  "^while",
  "^for",
  "^object",
  "^table",
  "block",
  "argument",
  "import_statement",
  "operation_type",
  "catch_clause",
  "if_statement",
  "else_clause",
  "jsx_element",
  "jsx_self_closing_element"
}
require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_trailing_blankline_indent = false,
  -- show_current_context_start = true
}
