---
name: label
description: Apply the data / reward / scaffolding rubric to a failed run and propose a label line for results/labels.csv.
argument-hint: [run-dir]
allowed-tools: Bash(uv run h2bench trace *) Bash(jq *) Read
---
Use the rubric at the top of `results/taxonomy.md`. For `$ARGUMENTS`:

1. Run the `/trace` procedure to find the point of no return.
2. Pick the earliest cause: a model that misread a tool because the tool printed 400 lines is
   scaffolding, not data.
3. Output exactly one CSV line in the format `run_id,task,model,primary,step,note` with the note under
   15 words, and the evidence (two trace lines) under it.

The human decides and pastes the line; `results/labels.csv` is not yours to edit.
