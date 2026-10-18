#!/usr/bin/env bash
# Stop: if Python changed since the last commit, run the fast test suite. A failure blocks the
# stop (exit 2) so Claude keeps going and fixes it. stop_hook_active prevents an infinite loop.
set -u
INPUT=$(cat)
active=$(printf '%s' "$INPUT" | jq -r '.stop_hook_active // false')
[ "$active" = "true" ] && exit 0
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0
changed=$( { git diff --name-only HEAD -- '*.py'; git ls-files --others --exclude-standard -- '*.py'; } | grep -c . )
[ "$changed" -eq 0 ] && exit 0
command -v uv >/dev/null 2>&1 || exit 0

out=$(timeout 300 uv run pytest -q -x -m "not openfoam" 2>&1)
status=$?
# 5 = pytest collected no tests (e.g. before tests/ exists); not a failure.
if [ $status -ne 0 ] && [ $status -ne 5 ]; then
  echo "Fast tests are failing; fix before stopping. Tail:" >&2
  echo "$out" | tail -n 25 >&2
  exit 2
fi
exit 0
