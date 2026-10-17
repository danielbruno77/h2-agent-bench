#!/usr/bin/env bash
# PostToolUse (Edit|Write): format and lint the touched Python file. Exit 2 feeds remaining
# lint errors back to Claude so it fixes them before moving on.
set -u
INPUT=$(cat)
FILE=$(printf '%s' "$INPUT" | jq -r '.tool_input.file_path // empty')
[ -z "$FILE" ] && exit 0
case "$FILE" in *.py) ;; *) exit 0 ;; esac
[ -f "$FILE" ] || exit 0
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
command -v uv >/dev/null 2>&1 || exit 0

uv run ruff format "$FILE" >/dev/null 2>&1
out=$(uv run ruff check --fix "$FILE" 2>&1)
status=$?
if [ $status -ne 0 ]; then
  echo "ruff still reports issues in $FILE:" >&2
  echo "$out" | head -n 20 >&2
  exit 2
fi
exit 0
