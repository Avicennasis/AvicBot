# Contributing to AvicBot

Thanks for considering a contribution. Bug reports, docs fixes, and small
improvements are all welcome.

## Dev setup

```bash
git clone https://github.com/Avicennasis/AvicBot.git
cd AvicBot
pip install ruff pre-commit
pre-commit install
```

## Running the tests

This repo has no automated test suite — each script is a standalone
Pywikibot utility. Lint checks are what CI validates:

```bash
ruff check .
ruff format --check .
```

## Code style

`pre-commit run --all-files` runs the full check locally (hygiene hooks
+ ruff lint + ruff format). Security checks (flake8-bandit equivalents)
are part of the ruff `S` rule group in `.ruff.toml`.

## PR checklist

- [ ] `ruff check .` is clean locally.
- [ ] `ruff format --check .` is clean locally.
- [ ] `pre-commit run --all-files` is clean.
- [ ] README and docs updated if public behavior changed.
- [ ] `CHANGELOG.md` updated under `[Unreleased]`.

## Code of Conduct

This project follows the [Contributor Covenant](CODE_OF_CONDUCT.md).
Be respectful; assume good faith.
