#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "=== Pushing submodules ==="
git submodule foreach 'echo "-- $name" && git push origin "$(git rev-parse --abbrev-ref HEAD)"'

echo ""
echo "=== Updating submodule references ==="
git add -A
if ! git diff --cached --quiet; then
  echo ""
  echo "Changed submodules:"
  git diff --cached --name-only | sed 's/^/  /'
  echo ""
  read -rp "Commit message: " msg
  if [[ -z "$msg" ]]; then
    msg="chore: update submodule references"
  fi
  git commit -m "$msg"
fi

echo "=== Pushing main workspace ==="
git push origin "$(git rev-parse --abbrev-ref HEAD)"

echo ""
echo "=== Done ==="
