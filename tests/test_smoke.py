from __future__ import annotations

from importlib.metadata import version

import h2bench


def test_version_matches_package_metadata() -> None:
    assert h2bench.__version__ == version("h2bench")
