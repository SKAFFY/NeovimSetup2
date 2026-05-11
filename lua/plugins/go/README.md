# Go Development Tools

This configuration requires the following binary tools to be installed.

## Quick Install

Run the install script:

```bash
./scripts/install-go-tools.sh
```

Or see Manual Installation below.

## Required Tools

| Tool | Purpose |
|------|---------|
| gopls | Go language server |
| golangci-lint | Go linter |
| impl | Interface implementation generator |
| gotests | Test generator |
| gomodifytags | Struct tag modifier |
| dlv | Debugger (Delve) |
| tinygo | TinyGo compiler (optional) |

## Manual Installation

### macOS / Linux

```bash
# gopls (language server)
go install golang.org/x/tools/gopls@latest

# golangci-lint (linter) - REQUIRED, use official install script
curl -sSfL https://golangci-lint.run/install.sh | sh -s -- -b "$(go env GOPATH)/bin" v2.12.2

# impl (interface implementation)
go install github.com/josharian/impl@latest

# gotests (test generation)
go install github.com/cweill/gotests/gotests@latest

# gomodifytags (struct tags)
go install github.com/fatih/gomodifytags@latest

# delve (debugger)
go install github.com/go-delve/delve/cmd/dlv@latest
```

### TinyGo (optional)

```bash
# macOS
brew install tinygo

# Linux - see https://tinygo.org/getting-started/install/linux/
```

### Windows

```powershell
# golangci-lint
choco install golangci-lint

# Other tools - same go install commands as above
```

## Keymaps

| Shortcut | Description |
|----------|-------------|
| `<leader>ge` | Generate `if err != nil` |
| `<leader>gt` | Add json tags to struct |
| `<leader>gT` | Generate all tests |
| `<leader>gtt` | Generate test for function |
| `<leader>gi` | Generate interface implementation |
| `<leader>gf` | Show interface implementations |

## TinyGo

When working with TinyGo projects:

```bash
# Set TinyGo target
:TinyGoSetTarget <target>

# Examples:
:TinyGoSetTarget cortex-m0
:TinyGoSetTarget wasm
:TinyGoSetTarget riscv64

# View available targets
:TinyGoTargets

# Exit TinyGo mode (restarts gopls for regular Go)
:LspRestart
```