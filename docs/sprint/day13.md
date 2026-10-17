# Day 13 · Thu 29 Oct · Stretch or hardening (3 h)

Goal: CI green on a clean clone; either a before/after fine-tune table or the fake provider with tests and coverage >= 70%.

Morning (10 min): fix the sentences the colleague got wrong, ten minutes and no more.
Go/no-go (5 min): stretch only if every never-cut item is done, README finished, dataset on the Hub, >= 30 clean passing trajectories, GPU rentable within the hour. Decide once.

Stretch: rent one 40 GB+ GPU (two hours budget); open-weights Mistral instruct model with function calling that fits; data = sft_best + clean sft rendered with the model's tool template, A3 held out, trajectories over 8k tokens dropped and counted; Unsloth LoRA r16 a32 lr 2e-4, 2-3 epochs, seq 8k, effective batch 8; serve with vLLM and its Mistral tool parser; harness OpenAI adapter with base_url; bench A1, A3, A6 x 2 seeds base vs ft; README "Fine-tune (preliminary)" with two honest sentences. Stop rule: no parseable tool calls by 21:00 -> write up the loss curve and pipeline, switch to hardening.

Hardening, in order: `harness/providers/fake.py` replaying scripted tool calls + tests for reminders, loop detection, budget stop, resume; `mypy --strict` on verifier and harness; stricter ruff set; docstrings; `pytest --cov` >= 70% on verifier and harness; grep repo and history for cluster paths and keys, `gitleaks detect`; delete dead code and TODOs; commit uv.lock; CITATION.cff, CHANGELOG.md, CONTRIBUTING.md; `--help` reads as docs; clean clone + `uv sync` + `pytest -q`.

Never delegated: LoRA hyperparameters, or the review of every mypy fix for `# type: ignore` abuse.
Drill: `git log -p -S "api_key" --all`; `gitleaks detect`; find the one module under 50% coverage.

Done when
- [ ] CI green on a clean clone, both jobs
- [ ] Stretch table with held-out task, or fake provider merged with coverage >= 70%
- [ ] No secrets, cluster paths or TODOs
- [ ] CITATION.cff and CHANGELOG.md present
