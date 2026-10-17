---
name: verify
description: Run the verifier on a submission and interpret the verdict check by check. Use after a run finishes or when a verdict is surprising.
argument-hint: [task-id] [submission-dir]
allowed-tools: Bash(uv run h2bench verify *) Bash(uv run h2bench trace *) Read
---
Run `uv run h2bench verify --task $0 --submission $1`. Then, from `verdict.json` and the printed table:

1. State pass or fail and the first check that failed.
2. For each failed check, quote the detail string and say whether it points at the agent (data), the
   task or verifier (reward), or the harness (scaffolding), using the rubric in `results/taxonomy.md`.
3. If a `reward` cause is possible, say exactly which tolerance or spec line to look at; do not change it.
4. If the submission has a `trace.jsonl`, run `uv run h2bench trace summary $1` and name the step at
   which the failure became inevitable.
