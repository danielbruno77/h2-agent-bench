# Day 12 · Wed 28 Oct · README as a report (3 h)

Goal: a colleague understands the repo from the README alone.

Before: the three numbers from summary.json on a sticky note (best pass rate, ours-vs-model failure share, before/after).

Blocks
- 60 min: README in this order: title and badges; headline paragraph (what, numbers, the one design idea); results table + results.png + footnote; demo GIF with the replay caption; architecture.svg + five bullets; how we grade (tolerance from noise, seven adversaries, four alternatives, fvSchemes rule); taxonomy table + paragraph; nine-task table; data; quickstart; design decisions; limitations and next; roadmap; citation, license, acknowledgements. Under two screens above the task table.
- 50 min: `h2bench replay <trace> --speed 1s`; vhs tape 1200 x 700, 14 pt, replay then verify, about 55 s; `docs/demo.gif` under 5 MB; fallback asciinema + agg, then three screenshots.
- 40 min: `docs/architecture.svg` (Excalidraw or draw.io, ten minutes); docs index; quickstart tested on the laptop with the `demo` task under five minutes in Docker.
- 20 min: send the README to one colleague with the one question; commit.

Never delegated: every sentence above the task table.
Drill: read the README with `less` on a half-width terminal; if the headline needs the table, rewrite the headline.

Done when
- [ ] README has real numbers; no TODO or WIP anywhere
- [ ] demo.gif plays in the GitHub preview and shows the recovery
- [ ] Quickstart runs on a laptop in under five minutes
- [ ] Colleague test sent
