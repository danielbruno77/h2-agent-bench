---
name: trace
description: Read an agent run's trace and find the point of no return, the tool errors and the stop reason. Use when labelling failures or debugging the harness.
argument-hint: [run-dir]
allowed-tools: Bash(uv run h2bench trace *) Bash(jq *) Bash(cat *) Read
---
For the run directory `$ARGUMENTS`:

1. `uv run h2bench trace summary $ARGUMENTS`; copy the footer (stop reason, submitted, verdict).
2. `jq -r 'select(.kind=="tool" and .ok==false) | [.step, .name, .error_type] | @tsv' $ARGUMENTS/trace.jsonl`
3. Identify the single step after which success was no longer possible, and quote the two or three
   trace lines around it with `uv run h2bench trace show $ARGUMENTS --step N`.
4. Propose one primary tag from the rubric (data, reward, scaffolding) with one sentence of evidence,
   and one secondary note. The human writes the label into `results/labels.csv`; you do not.
