# Day 5 · Wed 21 Oct · Error recovery and traces (3 h)

Goal: an injected mesh failure is recovered with no human help; traces are readable.

Blocks
- 50 min: `error_type` as a fixed Literal (timeout, mesh_failed, mesh_quality, diverged, not_converged, not_found, bad_arguments, forbidden_path, tool_crash, budget); one hand-written hint per type in `tools/hints.py`; failing messages carry a 30-line log tail and log_path; `warnings` list, never a refusal; test: broken snappyHexMeshDict -> mesh_failed with a cfmesh hint.
- 60 min: `harness/recover.py`: repeat-error reminder (once per type), loop detection (3 inject, 5 stop as `stuck`), checkpoint.json after every tool call and `--resume` that reloads messages only, stop-reason enum, `--chaos mesh_failed:1` default-off with a test; chaos run on A1; save the trace to `docs/examples/recovery-trace.jsonl`.
- 40 min: `h2bench trace summary`, `trace show --step N`, `runs ls`.
- 20 min: commit; NOTES.md: did it recover, in how many steps.

Never delegated: the hints and the recovery policies.
Drill: three jq one-liners on trace.jsonl before building the CLI; the CLI must reproduce them.

Done when
- [ ] Every failing tool result has a fixed error_type, a hint and a log tail
- [ ] Chaos run recovered and submitted; trace saved under docs/examples/
- [ ] `--resume` continues a run killed after a mesh call
- [ ] trace summary and runs ls work on every run so far
