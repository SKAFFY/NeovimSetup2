#!/bin/bash
set -e

GOPATH="${GOPATH:-$HOME/go}"
BIN_PATH="$GOPATH/bin"
VERSION="v2.12.2"

echo "Installing Go development tools..."
echo "BIN_PATH: $BIN_PATH"

mkdir -p "$BIN_PATH"

echo "Installing gopls..."
go install golang.org/x/tools/gopls@latest

echo "Installing golangci-lint (using official install script)..."
curl -sSfL https://golangci-lint.run/install.sh | sh -s -- -b "$BIN_PATH" $VERSION

echo "Installing impl..."
go install github.com/josharian/impl@latest

echo "Installing gotests..."
go install github.com/cweill/gotests/gotests@latest

echo "Installing gomodifytags..."
go install github.com/fatih/gomodifytags@latest

echo "Installing delve..."
go install github.com/go-delve/delve/cmd/dlv@latest

echo ""
echo "All Go tools installed successfully!"
echo ""
echo "Make sure $BIN_PATH is in your PATH:"
echo "  export PATH=\$PATH:$BIN_PATH"