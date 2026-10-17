# Day 15 · Sat 31 Oct · Fresh eyes and release (6 h)

Goal: v0.1.0 tagged with assets; the application ready to submit on Monday. No new features.

Blocks
- 90 min: clean-machine test: follow the quickstart literally on a machine that has never seen the repo, timer running; every deviation is a README bug, fixed at the end of the block; exercise clone, uv sync, Docker pull, demo run, verify, pytest, tasks validate, load_dataset, and after block 3 references fetch; note tested OSes.
- 60 min: MSc student protocol: README link + task A1 on the cluster with a capped key; thirty minutes watching without helping; fix the top three confusions; compare their one-sentence description with the headline.
- 60 min: `h2bench references pack` + manifest; traces tarball; CHANGELOG v0.1.0 entry; version bump; GHCR image tagged v0.1.0 and the quickstart pointing at it; tag, push, GitHub release with the three numbers and the assets; `references fetch` from the release URL tested on the clean machine; optional Zenodo DOI into CITATION.cff.
- 60 min: README on a phone; CV and letter numbers match summary.json; every link clicked logged out; regenerate and grep if any rerun changed a number; privacy pass (`grep -ri hylab`, site names, no hylab/ in history); git status clean; CI green on the tag.
- 30 min: Monday checklist (apply on Ashby with CV, letter, three links; post first; thank the lead; form answers; open the 12-month plan, Phase 3 starts Tue 3 Nov). Then stop. Sunday is off.

Never delegated: the tag, the clean-machine run, the stop.
Drill: `git clone --branch v0.1.0` into /tmp; `git describe --tags` equals `h2bench --version`.

Done when
- [ ] Quickstart followed literally on a clean machine; deviations fixed
- [ ] One student ran A1 from the README alone
- [ ] v0.1.0 released with assets; references fetch works
- [ ] Numbers consistent everywhere; privacy pass clean
- [ ] Monday checklist written
