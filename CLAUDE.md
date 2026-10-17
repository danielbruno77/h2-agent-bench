# h2-agent-bench

Verifier-graded benchmark of hydrogen CFD tasks in OpenFOAM, the agent harness that attempts them,
baselines for frontier models, and the trajectories released as training data. Built in a 15-day
sprint (17-31 Oct 2026). Sprint briefs live in `docs/sprint/`; `/day N` loads today's.

## How we work together (read this first)

The human is the reviewer; you are the typist for boilerplate. Concretely:

- You draft: packaging, CI, adapters, parsers, CLI tables, format conversions, test scaffolds, docstrings.
- The human writes, and you do not write unless explicitly asked in the same message: verifier check
  logic and order, task prompts, tolerances, error hints, failure labels, the README headline, CV text.
  If asked, produce it as a diff with a one-line rationale per change, never silently.
- Prefer small diffs. Stage files explicitly by name; never `git add -A` or `git add .`.
- When a number appears in code (tolerance, min_cells, threshold), its source must be a file under
  `tasks/*/` or `results/`; never type a number from memory.
- When you are unsure of an OpenFOAM keyword, grep `$FOAM_TUTORIALS` and say which file you copied from.
- Never claim a test passed, a run finished or a number is right without the command output in the turn.

## Commands

- Fast tests (no OpenFOAM): `uv run pytest -q -m "not openfoam"`
- OpenFOAM tests (needs sourced bashrc or Docker runner): `uv run pytest -q -m openfoam`
- Lint and format: `uv run ruff check . && uv run ruff format .`
- Types: `uv run mypy src/h2bench/verifier src/h2bench/harness`
- Tasks: `uv run h2bench tasks validate`
- One run: `uv run h2bench run --task A1 --model <id> --seed 0 --workdir runs/<name>`
- Verify: `uv run h2bench verify --task A1 --submission runs/<name>`
- Traces: `uv run h2bench trace summary runs/<name>`; `uv run h2bench runs ls runs/`

## Layout

`src/h2bench/{tools,harness,verifier}` are the package. `tasks/<id>/task.yaml` are the specs.
`tests/fixtures/duct2d` and `room2d` are the CI-sized cases. `runs/` is gitignored.
`results/` holds generated tables and the hand-written `labels.csv`. `data/` holds export scripts.

## Conventions

- Python 3.12, `uv`, `ruff` (line length 100), type hints everywhere, functions under 50 lines.
- A tool never raises to the agent: it returns `ToolResult(ok, data, error_type, message, hint, log_path, seconds)`.
  `error_type` is from the fixed `Literal` in `tools/result.py`; never a free string.
- No notebooks on the main path. No cluster paths, hostnames or `/home/...` in committed files.
- Secrets only in `.env` (gitignored). `.env.example` has empty values.
- Commit per block with a conventional message (`feat(verifier): ...`, `fix(harness): ...`, `docs: ...`).
- Never commit: `runs/`, time directories, `processor*`, `postProcessing/`, reference meshes, `.env`.

## OpenFOAM

- Assume OpenFOAM ESI (openfoam.com); keyword names are checked against `$FOAM_TUTORIALS` for the
  installed version before use. All commands go through `tools/run_of.py` (`H2BENCH_RUNNER=cluster|docker`).
- Dictionaries are edited with `foamDictionary` via `set_entry`, not by rewriting files.
- The verifier owns `controlDict`'s `functions` block and `endTime`; the agent may not change how a KPI is measured.

## Sprint

Day briefs: `docs/sprint/dayNN.md`. End of day: `/eod` runs the done-when list and writes three lines to `NOTES.md`.
Scope guards: never cut the verifier with its adversaries, the generated results table, CI, or the failure taxonomy.
