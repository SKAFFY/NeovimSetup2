return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "gopls" then
          vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<cr>", { buffer = args.buf, desc = "Generate if err != nil" })
          vim.keymap.set("n", "<leader>gt", "<cmd>GoTagAdd json<cr>", { buffer = args.buf, desc = "Add json tags" })
          vim.keymap.set("n", "<leader>gT", "<cmd>GoTestsAll<cr>", { buffer = args.buf, desc = "Generate all tests" })
          vim.keymap.set("n", "<leader>gtt", "<cmd>GoTestsFunc<cr>", { buffer = args.buf, desc = "Generate test for function" })
          vim.keymap.set("n", "<leader>gi", "<cmd>GoImpl<cr>", { buffer = args.buf, desc = "Generate interface implementation" })
          vim.keymap.set("n", "<leader>gf", "<cmd>GoImplements<cr>", { buffer = args.buf, desc = "Show interface implementations" })
        end
      end,
    })
    return opts
  end,
}