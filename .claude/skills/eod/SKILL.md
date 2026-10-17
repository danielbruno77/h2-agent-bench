---
name: eod
description: End of sprint day: check the day's done-when list, draft the three NOTES.md lines, and propose the final commit.
disable-model-invocation: true
argument-hint: [day-number]
---
Read `docs/sprint/day$ARGUMENTS.md` (zero-padded). Then:

1. For each item in its "Done when" list, run the command that proves it (tests, `h2bench tasks validate`,
   `git log`, file existence) and mark it done or not with the evidence in one line.
2. Draft three lines for `NOTES.md` under a `## Day $ARGUMENTS` heading: what worked, what did not,
   tomorrow's single goal. Include any PBS job ids found in today's conversation. Show them; the human
   pastes or edits.
3. List uncommitted files and propose the `/commit` grouping.
4. Say in one line which done-when items carry over to tomorrow morning, if any.
