# Day 10 · Mon 26 Oct · Failure taxonomy (3 h)

Goal: taxonomy table with counts; one fix measurably raised the pass rate.

Rubric (write it first at the top of results/taxonomy.md): data = knowledge the model lacks (recorded, not fixed this week); reward = task or verifier wrong (fixed tonight, re-verify all); scaffolding = harness or tools in the way (top items fixed tonight). Earliest cause wins.

Blocks
- 70 min: `h2bench runs ls --failed`; read every B failure and A4/A6 fully, the rest by summary; `results/labels.csv` (run_id, task, model, primary, step, note); `results/taxonomy.py` prints tag x model and tag x family.
- 60 min: fix the top 2-3 scaffolding items (error_type and hint at the top of failing messages; one-line interpretation in read_monitor; example payload in submit's description; timeouts); fix every reward item and `h2bench verify --all` the existing submissions; bump prompt_version and harness_version; relaunch affected (task, model) pairs with one seed for the before/after.
- 40 min: taxonomy.md (rubric, count tables, one worked example per tag, fixes applied, data failures by stage); README taxonomy section with the ours-versus-model share.
- 10 min: commit; NOTES.md.

Never delegated: every label.
Drill: write the failing step number down for three runs before reading the summary footer.

Done when
- [ ] Every failed run has a row in labels.csv
- [ ] Count tables and worked examples written
- [ ] Reward items fixed; set re-verified; table regenerated
- [ ] Scaffolding fixes merged with version bump; before/after reruns queued
