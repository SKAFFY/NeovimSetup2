return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
    },
    ft = "go",
    opts = {
      lsp_cfg = true,
      lsp_gofumpt = false,
    },
    config = function()
      require("plugins.go.deps")
    end,
  },
  { import = "plugins.go.lsp" },
  { import = "plugins.go.lint" },
  { import = "plugins.go.tinygo" },
  { import = "plugins.go.keymaps" },
}