---
paths:
  - "tasks/**"
  - "tests/fixtures/**"
  - "src/h2bench/tools/**"
---
# OpenFOAM rules

- Edit dictionaries with `foamDictionary` (`set_entry`) rather than rewriting files; `blockMeshDict`
  variables (`nx`, `ny`, `nz`, port extents) are the only parameters a mesh tool changes.
- Before using a function-object or solver keyword, grep `$FOAM_TUTORIALS` for the installed version and
  cite the tutorial file you copied from in the commit message.
- Never edit `constant/polyMesh/*`; meshes come from the mesh tool.
- Never commit time directories, `processor*`, `postProcessing/`, `log.*`, or reference meshes.
- Every case template has exactly `0/`, `constant/`, `system/` and nothing else.
- Family A measurement is the `planeCoV` surfaceFieldValue at x = 10D; family B uses `probes` at the
  12 candidate positions and the t = 60 s write. These blocks are canonical and verifier-owned.
- Convergence is judged on KPI flatness over the last 20% of iterations, not on residuals alone.
