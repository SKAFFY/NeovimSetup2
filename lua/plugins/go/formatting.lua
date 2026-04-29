return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Дополняем существующие настройки форматирования
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.go = { "goimports", "gofumpt" }
      return opts
    end,
  },
}
