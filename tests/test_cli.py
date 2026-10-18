from __future__ import annotations

from pathlib import Path

from typer.testing import CliRunner

from h2bench.cli import app

runner = CliRunner()
REPO_TASKS = Path(__file__).resolve().parents[1] / "tasks"


def test_validate_lists_a1() -> None:
    result = runner.invoke(app, ["tasks", "validate", "--tasks-dir", str(REPO_TASKS)])
    assert result.exit_code == 0, result.output
    assert "A1" in result.output
    assert "cov_h2_plane10D" in result.output


def test_validate_fails_on_invalid_spec(tmp_path: Path) -> None:
    bad = tmp_path / "Z9-broken"
    bad.mkdir()
    (bad / "task.yaml").write_text("id: Z9\nfamily: A\n")
    result = runner.invoke(app, ["tasks", "validate", "--tasks-dir", str(tmp_path)])
    assert result.exit_code == 1
    assert "Z9-broken" in result.output


def test_validate_fails_when_no_tasks(tmp_path: Path) -> None:
    result = runner.invoke(app, ["tasks", "validate", "--tasks-dir", str(tmp_path)])
    assert result.exit_code == 1
