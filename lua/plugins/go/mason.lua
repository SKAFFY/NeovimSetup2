return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Дополняем существующий список ensure_installed, а не заменяем
      local go_tools = {
        "golangci-lint",
        "delve",
        "gomodifytags",
        "impl",
        "gotests",
        "gopls",
      }
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, go_tools)
      return opts
    end,
  },
}
