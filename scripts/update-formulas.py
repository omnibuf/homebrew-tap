#!/usr/bin/env python3
"""Sync multi-arch binary Homebrew formulas with the latest GitHub Releases."""

from __future__ import annotations

import json
import os
import re
import sys
import urllib.request
from pathlib import Path

FORMULAS = [
    ("Formula/omnibuf.rb", "omnibuf/omnibuf-cli"),
    ("Formula/protoc-gen-omnibuf-go.rb", "omnibuf/omnibuf-go"),
    ("Formula/protoc-gen-omnibuf-nano.rb", "omnibuf/omnibuf-nano"),
]


def fetch_text(url: str) -> str:
    headers = {"User-Agent": "omnibuf-homebrew-tap-updater"}
    token = os.environ.get("GITHUB_TOKEN") or os.environ.get("GH_TOKEN")
    if token and "api.github.com" in url:
        headers["Authorization"] = f"Bearer {token}"
        headers["Accept"] = "application/vnd.github+json"
    req = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.read().decode("utf-8")


def parse_checksums(text: str) -> dict[str, str]:
    sums: dict[str, str] = {}
    for line in text.splitlines():
        parts = line.strip().split()
        if len(parts) >= 2 and re.fullmatch(r"[0-9a-fA-F]{64}", parts[0]):
            sums[parts[1].lstrip("*")] = parts[0].lower()
    return sums


def update_formula(formula_path: Path, repo: str) -> bool:
    release = json.loads(fetch_text(f"https://api.github.com/repos/{repo}/releases/latest"))
    tag: str = release["tag_name"]
    version = tag.removeprefix("v")

    checksum_asset = next(
        (a for a in release.get("assets", []) if a["name"] == "checksums.txt"),
        None,
    )
    if checksum_asset is None:
        raise RuntimeError(f"{repo} {tag}: missing checksums.txt release asset")

    checksums = parse_checksums(fetch_text(checksum_asset["browser_download_url"]))
    original = formula_path.read_text(encoding="utf-8")

    updated = re.sub(
        r'^(\s*version\s+)"[^"]+"',
        rf'\1"{version}"',
        original,
        count=1,
        flags=re.MULTILINE,
    )

    pair_re = re.compile(
        rf'(url\s+"https://github\.com/{re.escape(repo)}/releases/download/)v[^/]+/([^"]+)("\n\s*sha256\s+)"[0-9a-fA-F]{{64}}"'
    )

    matched = 0

    def replace_pair(m: re.Match[str]) -> str:
        nonlocal matched
        prefix, asset_name, mid = m.group(1), m.group(2), m.group(3)
        resolved_asset = asset_name
        digest = checksums.get(resolved_asset)
        if not digest and asset_name.startswith("protoc-gen-omnibuf-"):
            # Handle rename transition from protoc-gen-omnibuf-<os> to protoc-gen-omnibuf-go-<os>
            alt = asset_name.replace("protoc-gen-omnibuf-", "protoc-gen-omnibuf-go-", 1)
            if alt in checksums:
                resolved_asset = alt
                digest = checksums[alt]
        if not digest:
            raise RuntimeError(f"{repo} {tag}: checksum for {asset_name} not found in checksums.txt")
        matched += 1
        return f'{prefix}{tag}/{resolved_asset}{mid}"{digest}"'

    updated = pair_re.sub(replace_pair, updated)
    if matched == 0:
        raise RuntimeError(f"{formula_path}: no release asset URLs matched {repo}")

    if updated != original:
        formula_path.write_text(updated, encoding="utf-8")
        print(f"Updated {formula_path} -> {tag} ({matched} assets)")
        return True

    print(f"{formula_path} is already up to date ({tag})")
    return False


def main() -> int:
    root = Path(__file__).resolve().parent.parent
    changed = False
    for rel_path, repo in FORMULAS:
        if update_formula(root / rel_path, repo):
            changed = True
    return 0 if changed or True else 1


if __name__ == "__main__":
    sys.exit(main())
