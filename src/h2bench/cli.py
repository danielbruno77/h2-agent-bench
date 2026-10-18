from __future__ import annotations

from pathlib import Path
from typing import Annotated

import typer
import yaml
from pydantic import ValidationError
from rich.console import Console
from rich.table import Table

from h2bench.tasks import TaskSpec

app = typer.Typer(no_args_is_help=True, help="h2-agent-bench command line.")
tasks_app = typer.Typer(no_args_is_help=True, help="Inspect and validate task specs.")
app.add_typer(tasks_app, name="tasks")

console = Console()

COLUMNS = ("id", "family", "title", "kpi", "tolerance", "min_cells", "status")
UNBROKEN = {"id", "kpi"}


def load_task(path: Path) -> TaskSpec:
    """Parse one task.yaml into a TaskSpec; raises on YAML or schema errors."""
    data = yaml.safe_load(path.read_text())
    return TaskSpec.model_validate(data)


def _tolerance(spec: TaskSpec) -> str:
    v = spec.verification
    parts = []
    if v.tol_abs is not None:
        parts.append(f"abs {v.tol_abs:g}")
    if v.tol_rel is not None:
        parts.append(f"rel {v.tol_rel:g}")
    return ", ".join(parts) or "-"


def _row(path: Path) -> tuple[str, ...]:
    """One table row for a task.yaml: its fields if valid, else the first error line."""
    try:
        spec = load_task(path)
    except (OSError, yaml.YAMLError, ValidationError) as exc:
        first_line = str(exc).splitlines()[0]
        return (path.parent.name, "", "", "", "", "", f"[red]{first_line}[/red]")
    v = spec.verification
    fields = (spec.id, spec.family, spec.title, v.kpi, _tolerance(spec), str(v.min_cells))
    return (*fields, "[green]ok[/green]")


def _table(rows: list[tuple[str, ...]]) -> Table:
    """Render rows; id and kpi never wrap or truncate, so they stay greppable."""
    table = Table()
    for col, name in enumerate(COLUMNS):
        if name in UNBROKEN:
            width = max(len(name), *(len(row[col]) for row in rows))
            table.add_column(name, no_wrap=True, min_width=width)
        else:
            table.add_column(name)
    for row in rows:
        table.add_row(*row)
    return table


@tasks_app.command("validate")
def validate(
    tasks_dir: Annotated[Path, typer.Option(help="Directory holding <id>/task.yaml.")] = Path(
        "tasks"
    ),
) -> None:
    """Load every tasks/*/task.yaml and print a table; exit 1 if any fails."""
    paths = sorted(tasks_dir.glob("*/task.yaml"))
    if not paths:
        console.print(f"[red]no task.yaml found under {tasks_dir}[/red]")
        raise typer.Exit(1)

    rows = [_row(path) for path in paths]
    console.print(_table(rows))
    failed = sum(1 for row in rows if row[-1] != "[green]ok[/green]")
    if failed:
        console.print(f"[red]{failed} of {len(paths)} task specs invalid[/red]")
        raise typer.Exit(1)
