---
name: commit
description: Stage named files and write a conventional commit message from the diff and today's NOTES.md.
disable-model-invocation: true
allowed-tools: Bash(git status *) Bash(git diff *) Bash(git add *) Bash(git commit *) Bash(git log *) Read
---
1. `git status --porcelain`; list the changed files and ask which to include if more than one logical change is present.
2. Stage by file name only. Never `-A`, never `.`; never anything under `runs/`, time directories, `.env`.
3. Message: `type(scope): summary` with type in {feat, fix, docs, test, chore, refactor}, scope the package
   directory, summary under 72 characters; body lists what changed and which test covers it; when an
   OpenFOAM keyword was copied from a tutorial, name the tutorial file.
4. Show the exact `git commit -m` command and run it only after confirmation.
