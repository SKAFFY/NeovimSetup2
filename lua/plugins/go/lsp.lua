-- ~/.config/nvim/lua/plugins/go/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Дополняем конфигурацию gopls, сохраняя существующие настройки
      opts.servers = opts.servers or {}
      opts.servers.gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
              nilness = true,
              unusedwrite = true,
              implemented = true, -- Показывает, реализует ли структура интерфейс
            },
            completeUnimported = true,
            deepCompletion = true,
            staticcheck = true,
            gofumpt = true,
            -- Inlay hints для лучшей навигации
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      }

      return opts
    end,
  },
}
