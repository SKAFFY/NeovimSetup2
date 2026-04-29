-- ~/.config/nvim/lua/plugins/go.lua
return {
  -- Основной плагин для Go разработки
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
    },
    ft = "go",
    opts = {
      lsp_cfg = true,
      lsp_gofumpt = true,
      gofmt = "gofumpt",
      goimports = "golangci-lint",
      iferr_vertical_shift = 0,
    },
    keys = {
      -- ИСПРАВЛЕНО: <leader>ee вместо <leader>e (чтобы не конфликтовать с Explorer)
      { "<leader>ee", "<cmd>GoIfErr<cr>", desc = "Generate if err != nil" },
      { "<leader>gt", "<cmd>GoTagAdd json<cr>", desc = "Add json tags" },
      { "<leader>gi", "<cmd>GoImpl<cr>", desc = "Generate interface implementation" },
      { "<leader>gT", "<cmd>GoTestsAll<cr>", desc = "Generate all tests" },
      { "<leader>gtt", "<cmd>GoTestsFunc<cr>", desc = "Generate test for function" },
      { "<leader>gr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol" },
    },
    config = function(_, opts)
      require("go").setup(opts)

      -- Включение виртуального текста для интерфейсов
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          vim.cmd([[hi! link GoVirtualText Comment]])
          vim.opt_local.signcolumn = "yes"
          vim.api.nvim_set_hl(0, "GoVirtualText", { link = "Comment", default = true })
        end,
      })
    end,
  },
}
-- ~/.config/nvim/lua/plugins/go/treesitter.lua
