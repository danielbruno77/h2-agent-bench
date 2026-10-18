# src/h2bench/tasks.py
from pydantic import BaseModel


class Verification(BaseModel):
    kpi: str  # e.g. "cov_h2_plane10D"
    tol_abs: float | None = None
    tol_rel: float | None = None
    min_cells: int
    residual_max: float = 1e-4
    re_solve: bool = True
    forbid_reference_mesh: bool = True


class Budget(BaseModel):
    max_steps: int = 40
    max_minutes: int = 45
    max_usd: float = 3.0


class TaskSpec(BaseModel):
    id: str  # "A1"
    family: str  # "A" | "B"
    title: str
    prompt: str  # what the agent is told
    case_template: str  # path under tasks/
    parameters: dict = {}
    allowed_tools: list[str]
    verification: Verification
    reference: dict = {}  # kpi_value, mesh_fingerprint, filled Day 2
    budget: Budget = Budget()
