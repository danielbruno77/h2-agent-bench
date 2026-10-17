---
name: foam-keyword
description: Look up the correct OpenFOAM dictionary syntax for a function object or solver keyword in the installed version's tutorials before using it.
argument-hint: [keyword]
allowed-tools: Bash(grep *) Bash(rg *) Bash(find *) Bash(ls *) Bash(cat *) Read
---
For the keyword `$ARGUMENTS`:

1. `grep -rl "$ARGUMENTS" "$FOAM_TUTORIALS" 2>/dev/null | head -n 10` (if `FOAM_TUTORIALS` is unset, say so
   and ask for the OpenFOAM bashrc path from `.env.example`).
2. Open the best match and quote the complete dictionary block, with the tutorial path.
3. Point out any key whose name differs between OpenFOAM ESI and Foundation if you know of one, and say
   which line of the quoted block each of our keys maps to.
