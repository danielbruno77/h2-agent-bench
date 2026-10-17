# Day 1 · Sat 17 Oct · Skeleton, task schema, base case (6 h)

Goal: CI green on a public repo; the base blending case solves in minutes with its KPI extracted.

Blocks
- 20 min: write three decisions into NOTES.md: OpenFOAM flavour/version, solver tier for family A, repo name public from commit one.
- 60 min: README first, as the spec (headline placeholder, results markers, grading, quickstart, roadmap, status "v0.1.0 targeted 31 Oct").
- 60 min: `uv init --package h2bench --python 3.12`; deps; dirs; ruff; pre-commit; smoke test; CI workflow; Apache-2.0; .gitignore; first push; watch CI.
- 60 min: pydantic `TaskSpec`/`Verification`/`Budget`; `tasks/A1-baseline/task.yaml`; `h2bench tasks validate`.
- 90 min: square duct 0.1 m x 0.1 m x 2 m with a 0.02 m side port, blockMesh, simpleFoam + scalarTransport H2 + planeCoV + solverInfo; time on 1 and 8 cores; tier-2 timing; CI-sized 2D fixture under 30 s.
- 30 min: commit case (0/, constant/, system/ only) and fixture; NOTES.md three lines.

Never delegated today: blockMeshDict, the function objects, the TaskSpec model.
Delegated, then reviewed: pyproject, CI YAML, .gitignore, README scaffold.
Drill: stage the first commit with `git add -p` only.

Done when
- [ ] CI badge green on main
- [ ] `h2bench tasks validate` lists A1
- [ ] Base case under 5 min on 8 cores; CoV prints
- [ ] Tier timings and solver decision in NOTES.md
- [ ] `tests/fixtures/duct2d/` under 30 s on one core
