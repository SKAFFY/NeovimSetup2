return {
  "pcolladosoto/tinygo.nvim",
  ft = "go",
  cmd = { "TinyGoSetTarget", "TinyGoTargets", "TinyGoEnv" },
  opts = {
    config_file = ".tinygo.json",
  },
  config = function()
    require("tinygo").setup({})
  end,
}