vim.api.nvim_create_autocmd("User", {
  pattern = "TinyGoDone",
  callback = function()
    local ok, tinygo = pcall(require, "tinygo")
    if ok and tinygo.currentTarget == "original" then
      vim.lsp.enable('gopls', false)
      vim.lsp.stop_client(vim.lsp.get_clients({ name = "gopls" }), true)
      vim.lsp.enable('gopls', true)
    else
      vim.cmd("LspRestart gopls")
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ok, tinygo = pcall(require, "tinygo")
    if ok and tinygo.currentTarget and tinygo.currentTarget ~= "original" then
      tinygo.setTarget({ fargs = { "original" } })
    end
  end,
})