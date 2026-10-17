# Day 6 · Thu 22 Oct · Family A: six tasks (3 h)

Goal: six specs with references and tolerances; the verifier passes every reference.

Before: reference meshes as a release asset (`h2bench references fetch|pack`, committed manifest), not git.

Ladder: A1 baseline; A2 port width 0.02 -> 0.03 m; A3 injection 10 -> 20 m/s; A4 mesh-independent CoV shown with two levels under 3% (trace_checks: 2 meshes, 2 runs); A5 design A (0.02 m, 20 m/s) vs B (0.04 m, 5 m/s), winner and ratio; A6 lowest velocity in [5, 40] m/s with CoV <= 0.10 (verifier: resolved CoV meets target and velocity <= 1.10 * v_min).

Blocks
- 40 min: prompt template (Context, Goal, Deliverable, Constraints; never reveal min_cells or tolerance; `fvSchemes stays as provided`).
- 70 min: five task.yaml files; schema: `mode`, `submission_fields`, `trace_checks`; `verifier/objectives.py` registry with a5 and a6; trace check in verify; queue 16 reference jobs (medium + fine per task, A6 bisection).
- 40 min: validate six tasks; A1 still passes; README task rows; references fetch/pack commands.
- 20 min: commit; job ids in NOTES.md.

Never delegated: the prompts, the tolerances, the A6 bracket.
Drill: review each new task.yaml as `git diff --no-index --word-diff` against A1.

Done when
- [ ] Six specs validate; A1 reference passes
- [ ] a5 and a6 objectives have unit tests with synthetic values
- [ ] 16 reference runs queued
- [ ] README task table has six rows
