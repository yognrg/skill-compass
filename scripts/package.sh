#!/usr/bin/env bash
# Builds dist/skill-compass.zip for upload to Claude.ai or Claude Desktop.
# The zip has the skill folder at its top level, as those apps expect.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/dist"

mkdir -p "$OUT"
rm -f "$OUT/skill-compass.zip"

cd "$ROOT/skills"
zip -r "$OUT/skill-compass.zip" skill-compass -x "*.DS_Store"

echo "Created $OUT/skill-compass.zip"
