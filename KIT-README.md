# Claude Code kit for h2-agent-bench

Drop the contents of this folder into the repository root on Day 1 (block 2), commit everything except
`.claude/settings.local.json` if you create one.

```
CLAUDE.md                     project memory: how we work, commands, conventions, OpenFOAM rules
.claude/settings.json         permissions allowlist/denylist and the five hooks
.claude/hooks/                session-start, protect-files, guard-bash, post-edit-lint, stop-fast-tests
.claude/rules/                python.md, openfoam.md, verifier.md (path-scoped, load when those files are touched)
.claude/skills/               /day /eod /commit /review-diff /verify /trace /adversary /label /foam-keyword
.claude/agents/               verifier-reviewer, cfd-sanity, readme-stranger (subagents)
docs/sprint/dayNN.md          the 15 briefs that /day and /eod read
```

Requirements on the machine running Claude Code: `jq`, `uv`, `git`. Make the hook scripts executable
(`chmod +x .claude/hooks/*.sh`) if the copy lost the bit. Run `/hooks` once inside Claude Code to confirm
the five hooks are registered, and `/status` to confirm the settings file loaded.

Personal overrides (your own extra allow rules, a different notification hook) go in
`.claude/settings.local.json`, which is gitignored by Claude Code when it creates it; add it to
`.gitignore` yourself if you create it by hand.

What the pieces do, by day:

- Every day: `/day N` at the start, `/review-diff` before every `/commit`, `/eod N` at the end.
  The Stop hook runs the fast tests whenever Python changed and refuses to stop while they fail.
- Day 1: `/foam-keyword scalarTransport` and `/foam-keyword surfaceFieldValue` before writing controlDict.
- Day 2-3: the `verifier.md` rule and the `verifier-reviewer` subagent review every verifier change.
- Day 4-5: `/trace <run>` on the first traces; the chaos trace under `docs/examples/` is protected from edits.
- Day 7: `/adversary tampered_log agreement` scaffolds a builder with its test written first.
- Day 8: the `cfd-sanity` subagent checks the room case (Courant, Y to X conversion, injected volume).
- Day 9: `qsub` and `qdel` are denied to Claude; you launch `h2bench bench` yourself.
- Day 10: `/label <run>` proposes a line; `results/labels.csv` is protected so only you write it.
- Day 12 and 15: the `readme-stranger` subagent reads the README with CLAUDE.md withheld.
