# Changelog

All notable changes to `AvicBot` will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-09-10

### Added
- 2026 modernization: every shell and Python script rewritten and hardened
  (`set -euo pipefail`, quoted expansions, shared helpers), with GitHub Actions
  CI, pre-commit, ruff (including the `S` security rule group), `.editorconfig`,
  and release-drafter.

### Changed
- Legacy Toolforge Grid Engine (`jsub`/`jstart`) scheduling retired; the
  `crontab` is now a historical record pending migration to Toolforge Jobs.
