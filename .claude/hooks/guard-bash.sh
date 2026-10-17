#!/usr/bin/env bash
# PreToolUse (Bash): refuse destructive or leaky commands. Exit 2 blocks and explains.
set -u
INPUT=$(cat)
CMD=$(printf '%s' "$INPUT" | jq -r '.tool_input.command // empty')
[ -z "$CMD" ] && exit 0

deny() { echo "Blocked by guard-bash.sh: $1" >&2; exit 2; }

# destructive git
echo "$CMD" | grep -Eq 'git (push|commit).*(--force|-f\b|--no-verify)' && deny "no force pushes or --no-verify"
echo "$CMD" | grep -Eq 'git reset --hard|git checkout -- \.|git clean -fd' && deny "no history or worktree wipes; ask the human"
echo "$CMD" | grep -Eq 'git add (-A|--all|\.)( |$)' && deny "stage files by name, not with -A or ."
echo "$CMD" | grep -Eq 'git add .*\.env' && deny ".env is never staged"

# destructive filesystem outside scratch areas
if echo "$CMD" | grep -Eq '\brm -r[f]?\b|\brm -fr\b'; then
  echo "$CMD" | grep -Eq 'rm -r[f]? +(runs/|/tmp/|\./runs/|scratch/)' || deny "rm -rf only under runs/, scratch/ or /tmp"
fi

# cluster safety
echo "$CMD" | grep -Eq '\bqdel\b' && deny "job deletion is done by the human"
echo "$CMD" | grep -Eq '\bqsub\b' && deny "job submission is done by the human or by h2bench bench"

# key leakage into logs or files
echo "$CMD" | grep -Eq '(echo|printf|cat).*(API_KEY|SECRET|TOKEN)' && deny "never print secrets"
echo "$CMD" | grep -Eq '(MISTRAL|ANTHROPIC|OPENAI|HF)_(API_)?(KEY|TOKEN)=' && deny "keys live in .env, not on the command line"
echo "$CMD" | grep -Eq 'curl .*(-d|--data|-F).*(API_KEY|SECRET)' && deny "no secrets in curl payloads"

exit 0
