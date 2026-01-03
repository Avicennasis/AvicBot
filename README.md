# AvicBot

A collection of Python scripts for Wikipedia/Wikimedia automation using the [Pywikibot](https://www.mediawiki.org/wiki/Manual:Pywikibot) framework.

## Overview

AvicBot is a set of utility scripts for automated bot operations on Wikimedia wikis (Wikipedia, Commons, Meta, etc.). Originally developed in 2014 and modernized for 2026.

## Scripts

### misc/allfine.py

A status notification script that posts "All Systems Go!" messages to X (formerly Twitter) with timestamps. Useful for monitoring bot availability.

**Requirements:**
- Python 3.10+
- [tweepy](https://pypi.org/project/tweepy/) library

**Configuration:**
Set these environment variables with your X/Twitter API credentials:
- `X_CONSUMER_KEY`
- `X_CONSUMER_SECRET`
- `X_ACCESS_TOKEN`
- `X_ACCESS_TOKEN_SECRET`

**Usage:**
```bash
python misc/allfine.py
```

---

### misc/mysandboxes.py

Automated sandbox reset bot that cleans user sandbox pages on multiple Wikimedia wikis. Resets pages to predefined template content after a configurable delay.

**Requirements:**
- Python 3.10+
- [Pywikibot](https://pypi.org/project/pywikibot/) 9.x+
- Valid `user-config.py` for Pywikibot authentication

**Supported Wikis:**
- English Wikipedia
- Simple English Wikipedia
- Scots Wikipedia
- Esperanto Wikipedia
- Wikimedia Commons
- Wikimedia Meta-Wiki

**Usage:**
```bash
# One-shot mode (clean once and exit)
python misc/mysandboxes.py

# Continuous mode (repeat every 2 hours)
python misc/mysandboxes.py -hours:2

# Custom delay after last edit (10 minutes)
python misc/mysandboxes.py -delay:10

# Target specific wiki
python misc/mysandboxes.py -family:wikipedia -lang:en
```

---

### enwp/ - English Wikipedia Scripts

Shell scripts for generating category listings on English Wikipedia. Designed to run on Wikimedia Toolforge.

#### categories.sh

Generates lists from multiple Wikipedia categories including blocked users (spam/advertising), misplaced drafts, and AfC submissions.

```bash
./enwp/categories.sh
```

#### csd.sh

Lists all pages currently marked as candidates for speedy deletion.

```bash
./enwp/csd.sh
```

#### uaareport.sh / uaaby5min.sh

Monitors usernames with possible policy violations (UAA reports). The `uaaby5min.sh` variant runs more frequently for active monitoring.

```bash
# Standard report (30-minute interval)
./enwp/uaareport.sh

# Frequent update (5-minute interval)
./enwp/uaaby5min.sh
```

---

### redirects/ - Redirect Maintenance Scripts

A comprehensive suite of scripts for fixing broken and double redirects across multiple Wikimedia projects and languages.

**Single-Wiki Scripts:**
These scripts process redirects for a specific language edition (or project).
- `avicbotrdnews.sh`: Wikinews
- `avicbotrdquote.sh`: Wikiquote
- `avicbotrdsource.sh`: Wikisource
- `avicbotrdvoyage.sh`: Wikivoyage
- `commonsrd.sh`: Wikimedia Commons
- `enwprd.sh`: English Wikipedia
- `metard.sh`: Meta-Wiki

**Orchestrator Scripts:**
These scripts run via cron to trigger the single-wiki scripts for all supported languages sequentially.
- `avicbotrdnewsall.sh`
- `avicbotrdquoteall.sh`
- `avicbotrdsourceall.sh`
- `avicbotrdvoyageall.sh`

**Usage Example:**
```bash
# Fix redirects on English Wikinews
./redirects/avicbotrdnews.sh en

# Run the full Wikinews batch job
./redirects/avicbotrdnewsall.sh
```

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/Avicennasis/AvicBot.git
   cd AvicBot
   ```

2. Install dependencies:
   ```bash
   pip install tweepy pywikibot
   ```

3. Configure Pywikibot by running:
   ```bash
   python -m pywikibot generate_user_config
   ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

**Author:** Léon "Avic" Simmons ([@Avicennasis](https://github.com/Avicennasis))
