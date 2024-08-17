return {
  "stevearc/conform.nvim",
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
    },
    -- -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
