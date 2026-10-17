---
paths:
  - "src/**/*.py"
  - "tests/**/*.py"
  - "results/*.py"
  - "data/*.py"
---
# Python rules

- Type hints on every signature; `from __future__ import annotations` at the top of modules.
- Pydantic models for anything serialised (`TaskSpec`, `ToolResult`, `Verdict`, trace lines).
- Functions under 50 lines; a function that needs a comment to explain its sections is two functions.
- No `print` in library code; `rich` in CLI code; logging elsewhere.
- Subprocesses: always `timeout`, always capture to a log file, never `shell=True` with user input.
- Paths are `pathlib.Path`; anything that writes checks the path resolves inside the allowed directory.
- Tests: `tests/test_<module>.py`; OpenFOAM-dependent tests carry `@pytest.mark.openfoam`;
  everything else must run with no OpenFOAM and no API key (use `harness/providers/fake.py`).
- A new behaviour comes with its test in the same commit. A bug fix comes with the test that failed first.
