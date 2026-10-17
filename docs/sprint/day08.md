# Day 8 · Sat 24 Oct · Family B: the room, the leak, the sensors (6 h)

Goal: B1-B3 references verified. Scope check-in tonight.

Check-in first (15 min): verifier with adversaries, submitting harness, six A tasks with references, CI green. All four present: build B1-B3. Any missing: B1 only, and the hours go to the gap. Decide once.

Blocks
- 90 min: synthetic room as a multi-solid STL from numpy (6 x 4 x 3 m; door 0.9 x 2.1; vent 0.4 x 0.4 near the ceiling; equipment block; 0.05 x 0.05 leak patch); cfMesh 0.15 m with refinement near the leak and under the ceiling (60-120k cells); your dispersion solver, H2 + air, gravity, k-omega SST, PIMPLE Co 2, endTime 60, write every 5 s; probes at 12 candidates on a 3 x 4 grid at z = 2.7 m every 0.5 s; time S1 (target under 20 min on 8 cores).
- 60 min: KPIs: `lfl_volume_m3_t60`, `time_to_threshold`, `detection_matrix`, `sensor_objective` (brute force over 66 pairs); `tests/fixtures/room2d/` under 60 s; tests.
- 90 min: B1 (LFL cloud volume at 60 s), B2 (time to 25% LFL at probe 7), B3 (choose 2 of 12 over S1-S3, submit pair and predicted mean time); `objectives.b3` re-solves, brute-forces the optimum, checks pair objective and predicted time within tol; queue S1-S3 at two levels (6 jobs).
- 60 min: nine tasks validate; README rows; `docs/family-b.md` (plan view, Y<->X conversion: 4 vol% is Y = 0.0029, 1 vol% is Y = 0.0007; scenario table); scope decision for Days 9-15 in NOTES.md.
- 30 min: commit; confirm the six B jobs.

Never delegated: solver settings, leak rate, thresholds, the B3 objective.
Drill: compute injected H2 volume over 60 s on paper; compare with the tool's cloud volume.

Done when
- [ ] S1 under 20 min on 8 cores
- [ ] Four B post functions tested on room2d
- [ ] Nine tasks validate; b3 has a unit test with a synthetic T
- [ ] Six B reference jobs queued; scope decision written
