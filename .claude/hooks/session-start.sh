#!/usr/bin/env bash
# SessionStart: put the sprint day, the last notes and the git state into context.
# stdout from a SessionStart hook is added to Claude's context as plain text.
set -u
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

start="2026-10-17"
today=$(date +%F)
day=$(( ( $(date -d "$today" +%s) - $(date -d "$start" +%s) ) / 86400 + 1 ))
printf 'Sprint day %s of 15 (%s).' "$day" "$today"
brief=$(printf 'docs/sprint/day%02d.md' "$day")
if [ -f "$brief" ]; then printf ' Brief: %s (load with /day %s).' "$brief" "$day"; fi
printf '\n'

if [ -f NOTES.md ]; then
  printf 'Last NOTES.md lines:\n'
  tail -n 6 NOTES.md | sed 's/^/  /'
fi

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  printf 'git: %s\n' "$(git status -sb | head -n 1)"
  n=$(git status --porcelain | wc -l | tr -d ' ')
  printf 'uncommitted paths: %s\n' "$n"
fi
exit 0
