---
name: review-diff
description: Review the current uncommitted diff as a demanding reviewer, hunk by hunk, before anything is staged. Use after any generated change.
allowed-tools: Bash(git diff *) Bash(git status *) Read Grep
---
Run `git diff` (and `git diff --cached` if anything is staged). For every hunk, answer in one line each:

- What behaviour changed, in plain words.
- Is there a number in it? Where does it come from (file path), or is it typed from memory?
- Could it raise to the agent instead of returning a `ToolResult`?
- Is it covered by a test in this diff? If not, name the test that should exist.
- Does it touch a verifier check without touching `verifier/adversarial/` or the alternative tests?

End with: hunks you would stage as-is, hunks to fix first, and the exact `git add <file>` lines for the first group.
Do not stage or commit anything yourself.
