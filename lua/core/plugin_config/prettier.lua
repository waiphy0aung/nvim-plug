local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "php"
  },
  cli_options = {
    arrow_parens = "always",
    bracket_same_line = false,
    bracket_spacing = true,
    cursor_offset = -1,
    editorconfig = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    insert_pragma = false,
    jsx_single_quote = false,
    print_width = 120,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    require_pragma = "false",
    semi = true,
    single_attribute_per_line = true,
    single_quote = true,
    tabWidth = 2,
    trailingComa = "all",
    use_tabs = true
  }
})
