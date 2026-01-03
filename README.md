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
