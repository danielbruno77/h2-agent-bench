---
paths:
  - "src/h2bench/verifier/**"
  - "tests/test_verifier.py"
  - "tests/test_adversarial.py"
---
# Verifier rules

- Checks are named, run in order (structure, mesh, convergence, re_solve, agreement, correctness, trace),
  and all run even after a failure; the verdict lists every check with a detail string.
- The check logic and its order are written by the human. Propose changes as a diff with rationale.
- A change to any check lands in the same commit as a change to `verifier/adversarial/` or the
  alternative-route tests that exercises it. No exceptions.
- Tolerances, `min_cells` and reference values are read from `tasks/<id>/task.yaml` and
  `tasks/<id>/mesh_study.json`; never typed into Python.
- The re-solve computes the KPI with the PyVista route, independent of the agent's function objects.
- The verifier overwrites `controlDict`'s `functions` block and `endTime` from the task's canonical copy
  before re-solving, and leaves `fvSchemes` and `fvSolution` as the agent set them.
