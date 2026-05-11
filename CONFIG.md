# NeoVim Configuration

## Структура

```
nvim/
├── init.lua                      # Точка входа
├── CONFIG.md                     # Этот файл
├── lazyvim.json                  # LazyVim конфиг
├── lazy-lock.json                # Lock файл плагинов
├── stylua.toml                   # Форматирование Lua
├── lua/
│   ├── config/                   # Основные настройки
│   │   ├── lazy.lua              # Загрузка плагинов (lazy.nvim)
│   │   ├── options.lua           # Настройки nvim
│   │   ├── keymaps.lua           # Глобальные горячие клавиши
│   │   └── autocmds.lua          # Автокоманды
│   └── plugins/                  # Плагины
│       ├── *.lua                 # Файлы плагинов
│       └── <language>/           # Папка для языка программирования
│           ├── README.md         # Документация по установке
│           ├── deps.lua          # Проверка бинарных зависимостей
│           ├── lsp.lua           # LSP настройка
│           ├── lint.lua          # Линтер
│           ├── keymaps.lua       # Горячие клавиши
│           └── tinygo.lua        # Специфичные настройки
└── scripts/                      # Скрипты установки
    └── install-<language>-tools.sh
```

## Принципы организации

### Один язык = одна папка
Каждый язык программирования имеет свою папку в `lua/plugins/`. Например:
- `lua/plugins/go/` — Go
- `lua/plugins/rust/` — Rust (если будет добавлен)
- `lua/plugins/python/` — Python (если будет добавлен)

### Изоляция конфигов
Конфигурация одного языка не должна влиять на другой. Все настройки языка лежат в его папке.

### Ручная установка бинарных инструментов
Плагины языков используют внешние бинарные инструменты (lsp, linter, formatter). Они устанавливаются вручную через скрипты в `scripts/`.

### Без lazyvim extras для языков
Language-specific настройки НЕ берутся из `lazyvim.plugins.extras.lang.*`. Все настройки в своих папках.

## Добавление нового языка

1. Создать папку `lua/plugins/<language>/`
2. Создать основной файл плагина `<language>.lua` с импортами
3. Добавить модули:
   - `lsp.lua` — настройка LSP сервера
   - `lint.lua` — настройка линтера
   - `keymaps.lua` — горячие клавиши
   - `deps.lua` — проверка бинарных зависимостей
4. Создать скрипт `scripts/install-<language>-tools.sh`
5. Создать документацию `lua/plugins/<language>/README.md`

## Текущие языковые папки

| Папка | Язык | Описание |
|-------|------|----------|
| `lua/plugins/go/` | Go | gopls, golangci-lint, TinyGo |

## Текущие плагины

| Плагин | Назначение |
|--------|------------|
| ray-x/go.nvim | Go инструменты (if err, теги, тесты) |
| pcolladosoto/tinygo.nvim | TinyGo поддержка |
| neovim/nvim-lspconfig | LSP клиент |
| mfussenegger/nvim-lint | Линтер |
| sudo-tee/opencode.nvim | AI ассистент |

## Команды

- `:Lazy` — менеджер плагинов
- `:Mason` — установка языковых серверов (если используется)
- `:LspInfo` — информация о LSP

## Конфликты

При добавлении новых плагинов проверять:
1. Нет ли конфликта с существующими плагинами (дублирование функций)
2. Не перезаписывают ли настройки другие плагины
3. Все ли бинарные инструменты установлены

## Ссылки

- [LazyVim docs](https://lazyvim.github.io/)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-lint](https://github.com/mfussenegger/nvim-lint)