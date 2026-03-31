#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "=== Pulling submodules ==="
git submodule foreach 'echo "-- $name" && git pull --rebase origin "$(git rev-parse --abbrev-ref HEAD)"'

echo ""
echo "=== Pulling main workspace ==="
git pull --rebase origin "$(git rev-parse --abbrev-ref HEAD)"

echo ""
echo "=== Done ==="
