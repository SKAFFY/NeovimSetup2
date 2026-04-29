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
            },
            completeUnimported = true,
            deepCompletion = true,
            staticcheck = true,
            gofumpt = true,
          },
        },
      }

      -- Добавляем горячие клавиши для LSP (используем правильный метод)
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
        { "<leader>gI", vim.lsp.buf.type_definition, desc = "Type Definition" },
      })
      return opts
    end,
  },
}
