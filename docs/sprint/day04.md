# Day 4 · Tue 20 Oct · Harness v1: first unattended run (3 h)

Goal: one model completes task A1 with no human in the loop; trace and cost recorded.

Before: `uv add mistralai openai anthropic python-dotenv tenacity`; keys in .env (gitignored); `.env.example`; `harness/prices.yaml` with today's prices and date.

Blocks
- 45 min: JSON schemas for mesh, check_mesh, run_solver, read_monitor, extract_kpi, set_entry, read_file (tail_lines), write_file, list_dir, submit; descriptions state returns and the common failure hint; `dispatch` validates name against allowed_tools and args with pydantic, never lets an exception escape.
- 60 min: neutral OpenAI-shaped message list; `Provider` protocol; Mistral adapter first, OpenAI second, Anthropic third (tomorrow if needed); tenacity retries; usage and cost.
- 60 min: `run_task` loop (nudge twice on no tool calls, submit ends the run, budget stops); `harness/prompts/system.md` with prompt_version; trace JSONL fields; first run from an 8-core interactive job; verify it; read the whole trace and list the stumbles in NOTES.md.
- 15 min: commit; `runs/` gitignored.

Never delegated: the loop and the system prompt.
Drill: open the Mistral SDK source file; `breakpoint()` before the first dispatch; step one iteration.

Done when
- [ ] `h2bench run` with Mistral finishes A1 unattended and writes submission.json and trace.jsonl
- [ ] `h2bench verify` prints a verdict on that run
- [ ] Every trace line carries tokens and cost
- [ ] A second adapter exists
