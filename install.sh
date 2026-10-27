#!/usr/bin/env bash
# Skill Compass installer
# Copies the skill into the skills folder of the agent you choose.
#
# Usage:
#   ./install.sh                 install for Claude Code (personal, all projects)
#   ./install.sh --claude        same as above
#   ./install.sh --codex         install for Codex (~/.agents/skills)
#   ./install.sh --project       install into the current project (.claude/skills)
#   ./install.sh --dir <path>    install into any skills folder you name
#   ./install.sh --help          show this help

set -euo pipefail

SKILL_NAME="skill-compass"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/skills/$SKILL_NAME"

usage() {
  sed -n '2,12p' "$0" | sed 's/^# \{0,1\}//'
}

if [ ! -f "$SOURCE/SKILL.md" ]; then
  echo "Could not find $SOURCE/SKILL.md. Run this script from the cloned repo." >&2
  exit 1
fi

TARGET_ROOT="$HOME/.claude/skills"

case "${1:-}" in
  ""|--claude) TARGET_ROOT="$HOME/.claude/skills" ;;
  --codex)     TARGET_ROOT="$HOME/.agents/skills" ;;
  --project)   TARGET_ROOT="$PWD/.claude/skills" ;;
  --dir)
    if [ -z "${2:-}" ]; then
      echo "--dir needs a path." >&2
      exit 1
    fi
    TARGET_ROOT="$2"
    ;;
  -h|--help) usage; exit 0 ;;
  *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
esac

DEST="$TARGET_ROOT/$SKILL_NAME"
mkdir -p "$TARGET_ROOT"

if [ -e "$DEST" ]; then
  echo "Updating existing install at $DEST"
  rm -rf "$DEST"
fi

cp -R "$SOURCE" "$DEST"

echo "Installed Skill Compass to $DEST"
echo "Restart your agent session, then try: /skill-compass"
