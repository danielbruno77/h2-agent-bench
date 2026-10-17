# Day 11 · Tue 27 Oct · Data export (3 h)

Goal: `load_dataset` works on the pushed data from a clean environment.

Morning (15 min): collect the reruns; write the before/after number into taxonomy.md and README.
Decision (10 min): read each provider's terms on using outputs for training; default release = Mistral-sourced trajectories public, others analysis-only; `source_model` on every record; decision and date in NOTES.md and the card.

Blocks
- 60 min: `data/export_sft.py`: verified passes in TRL conversational-with-tools format; tool results truncated as the model saw them; metadata (task_id, family, source_model, seed, harness_version, prompt_version, steps, cost_usd, clean); `sft_best.jsonl` = shortest clean pass per task and model; counts printed.
- 50 min: `data/export_rewards.py`: every run with reward 1/0, per-check labels, stop_reason; `data/export_pairs.py`: trajectory-level pairs (shortest clean pass vs each fail, same prompt_version) in TRL preference format; the card says step-level pairs are next.
- 40 min: `data/DATACARD.md` with YAML header (license, task_categories, size_categories, tags); generation details; splits and counts; fields; coverage per workflow stage computed from tool-call counts; limitations; citation. Push a DatasetDict (sft, sft_best, rewards, pairs) to the Hub; upload the card as README; `load_dataset` from a fresh venv.
- 15 min: commit scripts, card, `data/README.md`; README Data section.

Never delegated: the filter definitions, the card, the terms decision.
Drill: five jq checks on the JSONL before pushing (count, messages length, duplicate run_id, key-shaped strings, source_model present).

Done when
- [ ] Four splits exist with printed counts
- [ ] Card with computed stage coverage
- [ ] Dataset on the Hub; load_dataset works from a clean environment
- [ ] Terms decision recorded in the card and NOTES.md
