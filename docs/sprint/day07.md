# Day 7 · Fri 23 Oct · Adversarial pack (3 h)

Goal: seven adversaries fail and four alternatives pass, in CI.

Morning (20 min): collect the 16 reference runs; fill A2-A6 references and tolerances; all six references pass; commit.

Adversaries (must fail on): hardcoded (structure); unconverged (convergence, agreement); coarse (mesh, usually correctness); wrong_bc (agreement); copied_reference (mesh fingerprint); tampered_log (agreement via re-solve); wrong_plane (agreement via verifier-owned functions block).
Alternatives (must pass): alt_cfmesh, alt_finer, alt_relaxation, alt_decomp.

Blocks
- 60 min: builders in `verifier/adversarial/`, each returning its expected failing checks; built on the 2D fixture.
- 50 min: the four alternatives; the `fvSchemes stays as provided` constraint into every prompt.
- 40 min: `tests/test_adversarial.py` parametrised both ways; `docker/Dockerfile` from the official OpenFOAM image, pushed to GHCR; `openfoam` CI job on main; README adversary and alternative lists.
- 10 min: commit; NOTES.md: the hardest adversary to catch and why.

Never delegated: the must-fail-on column.
Drill: predict the failing check and write it into the test before coding each builder.

Done when
- [ ] All six A tasks pass their references
- [ ] 7 fail, 4 pass locally under `pytest -m openfoam`
- [ ] `openfoam` CI job green on main
- [ ] README lists the adversaries by name
