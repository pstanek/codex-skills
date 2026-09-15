#!/usr/bin/env bash
# Link this marketplace's skills into ~/.agents/skills so Cursor and Codex
# discover the same canonical copies. Mirrors Open Mercato's install-skills,
# without their tiers or product-local .ai/skills tree.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}"
FORCE=0

usage() {
  cat <<'EOF'
Usage: scripts/install-skills.sh [--force] [--uninstall]

  --force       Replace an existing non-symlink at the destination.
  --uninstall   Remove only symlinks that point into this repo.

Destination: $HOME/.agents/skills (override with AGENTS_SKILLS_DIR).
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force) FORCE=1 ;;
    --uninstall) MODE=uninstall ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
  shift
done

MODE="${MODE:-install}"
mkdir -p "$DEST"

is_ours() {
  local link="$1"
  [[ -L "$link" ]] || return 1
  local target
  target="$(readlink "$link")"
  [[ "$target" == "$ROOT/plugins/"* ]]
}

if [[ "$MODE" == uninstall ]]; then
  for link in "$DEST"/*; do
    [[ -e "$link" || -L "$link" ]] || continue
    if is_ours "$link"; then
      rm "$link"
      echo "removed $(basename "$link")"
    fi
  done
  exit 0
fi

shopt -s nullglob
for skill_md in "$ROOT"/plugins/*/skills/*/SKILL.md; do
  skill_dir="$(cd "$(dirname "$skill_md")" && pwd)"
  name="$(basename "$skill_dir")"
  dest="$DEST/$name"

  if [[ -L "$dest" ]]; then
    rm "$dest"
  elif [[ -e "$dest" ]]; then
    if [[ "$FORCE" -eq 1 ]]; then
      rm -rf "$dest"
    else
      echo "skip $name (exists and is not a symlink; pass --force)" >&2
      continue
    fi
  fi

  ln -s "$skill_dir" "$dest"
  echo "linked $name -> $skill_dir"
done
