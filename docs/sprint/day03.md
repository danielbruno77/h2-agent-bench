# Day 3 · Mon 19 Oct · Verifier v1 and the HyLab pitch (3 h)

Goal: the verifier passes the reference submission and fails a hard-coded answer, naming the check.

Morning (20 min): `--collect` the mesh study; write reference, fingerprint, tol_abs, min_cells into A1's task.yaml; numbers into the docs; commit.
At work (15 min): the pitch to the HyLab lead (sensor-placement tool, generic tooling open source, site data private); ask for hours, a written OK, and the drawings/scenario owners. Note the answer.

Blocks
- 75 min: `verify(task, submission_dir)` as named checks run in order, all recorded: structure, mesh (checkMesh ok, min_cells, fingerprint != reference), convergence (residuals + KPI flatness), re_solve (copy, strip time dirs, canonical functions/endTime, PyVista KPI), agreement (|reported - resolved| <= tol/2), correctness (analysis: |resolved - reference| <= tol; design: registry). `mode` field with default `analysis`. Verdict to `verdict.json`; `h2bench verify` CLI.
- 45 min: tests: reference passes; hardcoded fails at structure; 20-iteration run fails at convergence.
- 40 min: `tasks/A1-baseline/reference/` (kpi.json, fingerprint, mesh_study.json); commit; NOTES.md.

Never delegated: the six checks and their order.
Drill: write `test_hardcoded_fails` before `verify()` exists; `pytest -x --lf -k hardcoded`.

Done when
- [ ] A1 has measured tolerance and reference; study table in docs
- [ ] `h2bench verify` passes the reference, fails the hard-coded one by name
- [ ] `mode` in the schema
- [ ] HyLab answer recorded
