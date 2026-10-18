# NOTES

## Day 1

### A1 base case, tier 1 (simpleFoam + kOmegaSST + scalarTransport H2)

OpenFOAM v2512 (opencfd/openfoam-default, linuxARM64), Docker Desktop on the Mac (14 CPUs visible).
Mesh: 10 mm cells, nx 200, ny 10, nz 10 = 20000 hexahedra (blockMesh log `nCells: 20000`).

| run | cores | iterations | ClockTime | CoV(H2) at x = 1.2 m, it 1000 |
|-----|-------|------------|-----------|-------------------------------|
| A1-np1 | 1 | 1000 | 29 s | 0.5107 |
| A1-np8 | 8 (scotch) | 1000 | 10 s | 0.5111 |

H2 diffusivity is nu + nut (alphaD 1, alphaDt 1). An earlier run with a constant `D 7e-5` gave
CoV 0.947: a constant D switches off turbulent diffusion in scalarTransport, so it was removed.

Target was under 5 min on 8 cores for 1000 iterations: met.

### Tier 2 timing

FOAM Iberia variable-density setup (rhoReactingBuoyantFoam, inert H2/CH4, kOmegaSST) dropped
onto the same 20000-cell A1 mesh with patches renamed and its own boundary conditions kept;
8 cores (scotch).

| run | cores | iterations | ClockTime |
|-----|-------|------------|-----------|
| A1-tier2-np8 | 8 | 1000 | 13 s |
| A1-tier2-np8 | 8 | 3500 (setup's endTime) | 37 s |

Under 10 minutes, so by the rule below tier 2 becomes the solver for A4-A6 and B.

Decision rule: under 10 minutes on 8 cores, tier 2 becomes the solver for A4-A6 and B; over 10
minutes, all A tasks stay tier 1 and B uses tier 2 at its own coarse resolution.

### CI fixture

`tests/fixtures/duct2d/`: 2D slice through the port, 1000 cells, 200 iterations,
ExecutionTime 0.32 s on one core, CoV(H2) 0.6711 at iteration 200.

### End of day

- Worked: A1 tier-1 case meshes and runs 1000 its in 10 s on 8 cores (CoV 0.511); tier-2 FOAM Iberia setup on the same mesh 37 s for 3500 its, so tier 2 takes A4-A6 and B; duct2d fixture 0.3 s.
- Didn't: constant `D` in scalarTransport silently dropped turbulent diffusion (CoV 0.947, caught and removed); `nu` is still an unsourced placeholder; README has no CI badge yet.
- Tomorrow: `pytest -m openfoam` passing end to end on duct2d through the tools layer (run_of docker branch must `cd` into the case, since the image's `bash -l` ignores `-w`).
