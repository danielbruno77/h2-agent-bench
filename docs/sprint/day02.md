# Day 2 · Sun 18 Oct · Tools layer and the mesh-noise study (6 h)

Goal: pytest runs one tiny case end to end; the three-level mesh study is queued overnight.

Blocks
- 15 min: finish Day 1 leftovers; `which` every OpenFOAM binary in a sourced shell; `FOAM_BASHRC` in .env.example.
- 90 min: `ToolResult` contract; `run_of` (bash -lc, log capture, timeout, docker branch); `mesh` (blockMesh via variables, snappy, cfmesh); `check_mesh` regexes; `mesh_fingerprint`.
- 90 min: `run_solver` (endTime, decomposePar, mpirun, reconstructPar, divergence detection); `read_monitor` (header-parsed solverInfo, KPI flatness over last 20%); `extract_kpi` two routes agreeing within 1%; tests marked `openfoam`.
- 60 min: `h2bench tolerance study --task A1 --ratio 1.4 --levels 3`; PBS jobs for three levels plus the 4-core noise run; `docs/tolerance-from-noise.md` method written.
- 30 min: `h2bench tools mesh|check|run|kpi`; commit; NOTES.md with job ids.

Tolerance rule: `tol = max(2*|f_medium - f_fine|, GCI_fine*f_fine, 0.01*f_fine)`; reference = fine; min_cells = 0.8 * cells_medium.

Never delegated: the ToolResult contract, the tolerance rule, the PBS script.
Drill: tmux session `sprint`; grep the checkMesh log by hand before writing its regex.

Done when
- [ ] `pytest -m openfoam` passes locally on the 2D fixture
- [ ] `h2bench tools kpi` prints both CoV values within 1%
- [ ] Four PBS jobs queued; ids in NOTES.md
- [ ] Tolerance method in docs; CI still green
