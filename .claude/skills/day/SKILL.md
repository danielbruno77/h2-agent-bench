---
name: day
description: Load the sprint brief for a given day (1-15) and plan the session around its blocks and done-when list.
disable-model-invocation: true
argument-hint: [day-number]
---
Read `docs/sprint/day$ARGUMENTS.md` (zero-pad: day 3 is `day03.md`). Then:

1. Summarise the day in three lines: goal, blocks with their minutes, done-when.
2. List what the brief marks as "never delegated"; you will not write those unless asked in the same message.
3. Check `NOTES.md` for yesterday's leftover and put it first if present.
4. Propose the first concrete action for block 1 and wait for confirmation before editing anything.
