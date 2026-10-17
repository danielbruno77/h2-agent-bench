---
name: adversary
description: Scaffold a new adversarial submission builder, with the predicted failing check written into the test before the builder exists.
argument-hint: [adversary-name] [expected-failing-checks]
---
Create `src/h2bench/verifier/adversarial/$0.py` for the adversary `$0`, expected to fail on: $1.

Order of work, and do not skip the first step:

1. Add the parametrised case to `tests/test_adversarial.py` first, asserting `not verdict.passed`
   and that each of `$1` is among the failed check names. Run it; it must fail because the builder
   does not exist yet.
2. Write the builder: a function `build(task, out_dir) -> list[str]` that produces the submission
   directory from the 2D fixture and returns the expected failing checks.
3. Run the test until green. Then run the four alternative-route tests to confirm nothing honest broke.
4. Add one line to the README adversary list in the same commit.
