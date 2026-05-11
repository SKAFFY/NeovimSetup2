return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Добавляем Go в список гарантированно установленных парсеров
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "go") then
        table.insert(opts.ensure_installed, "go")
      end
      return opts
    end,
    -- Только кастомная подсветка для интерфейсов (чего нет в LazyVim по умолчанию)
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Подсветка для интерфейсов и их реализаций
      vim.treesitter.query.set_query(
        "go",
        "highlights",
        [[
          (interface_type) @interface
          (type_spec name: (identifier) @type.interface)
          (method_spec) @method
          (method_declaration) @method
          (field_declaration name: (field_identifier) @field)
          (parameter_declaration name: (identifier) @parameter)
        ]]
      )

      -- Подсветка для связей "implements" (через Treesitter captures)
      vim.treesitter.query.set_query(
        "go",
        "locals",
        [[
          (interface_type) @definition.interface
          (type_spec name: (identifier) @definition.type)
        ]]
      )
    end,
  },
}
