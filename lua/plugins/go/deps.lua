local M = {
  tools = {
    { name = "gopls", desc = "Go language server" },
    { name = "golangci-lint", desc = "Go linter" },
    { name = "impl", desc = "Interface implementation generator" },
    { name = "gotests", desc = "Test generator" },
    { name = "gomodifytags", desc = "Struct tag modifier" },
    { name = "dlv", desc = "Debugger" },
  },
}

function M.check()
  local missing = {}
  local gopath = vim.fn.getenv("GOPATH")
  if gopath == "" then
    gopath = vim.fn.expand("~/go")
  end
  local bin_path = gopath .. "/bin"

  for _, tool in ipairs(M.tools) do
    local cmd = bin_path .. "/" .. tool.name
    if vim.fn.executable(cmd) == 0 then
      table.insert(missing, tool.name)
    end
  end

  if #missing > 0 then
    vim.notify(
      "Go tools: missing " .. table.concat(missing, ", ") .. "\nRun: ./scripts/install-go-tools.sh or see lua/plugins/go/README.md",
      vim.log.levels.WARN
    )
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.bo.filetype == "go" or vim.fn.expand("%:e") == "go" then
      M.check()
    end
  end,
})

return M